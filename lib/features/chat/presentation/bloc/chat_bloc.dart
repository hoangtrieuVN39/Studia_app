import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/chat/domain/entities/message.dart';
import 'package:studia/features/chat/domain/usecases/chip_message.dart';
import 'package:studia/features/chat/domain/usecases/create_message.dart';
import 'package:studia/features/chat/domain/usecases/get_message_stream.dart';
import 'package:studia/features/chat/domain/usecases/send_message.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChipMessage chipMessageUseCase;
  final SendMessage sendMessageUseCase;
  final GetMessageStream getMessageStreamUseCase;
  final CreateMessage createMessageUseCase;

  final User user;

  StreamSubscription<Message>? _messageSubscription;

  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  ChatBloc({
    required this.chipMessageUseCase,
    required this.sendMessageUseCase,
    required this.getMessageStreamUseCase,
    required this.createMessageUseCase,
    required this.user,
  }) : super(const ChatState()) {
    on<_Initial>(_onInitialEvent);
    on<_TextChanged>(_onTextChangedEvent);
    on<_SendMessage>(_onSendMessageEvent);
    on<_ClickChip>(_onClickChipEvent);
    on<_MessageReceived>(_onMessageReceivedEvent);

    add(const _Initial(groupId: 'default_group_id'));
  }

  Future<void> _onInitialEvent(_Initial event, Emitter<ChatState> emit) async {
    emit(state.copyWith(isLoading: true, error: null, messageHistory: []));
    await _messageSubscription?.cancel();

    final eitherStream = await getMessageStreamUseCase(
      GetMessageStreamParams(groupId: event.groupId),
    );

    eitherStream.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.toString())),
      (messageStream) {
        _messageSubscription = messageStream.listen(
          (message) {
            add(_MessageReceived(message));
          },
          onError: (error) {
            emit(
              state.copyWith(
                isLoading: false,
                error: "Stream error: ${error.toString()}",
              ),
            );
          },
          onDone: () {
            emit(state.copyWith(isLoading: false));
          },
        );
      },
    );
  }

  void _onMessageReceivedEvent(
    _MessageReceived event,
    Emitter<ChatState> emit,
  ) {
    emit(
      state.copyWith(messageHistory: [...state.messageHistory, event.message]),
    );
  }

  Future<void> _onTextChangedEvent(
    _TextChanged event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(messageContent: event.text));
  }

  Future<void> _onClickChipEvent(
    _ClickChip event,
    Emitter<ChatState> emit,
  ) async {
    final result = await chipMessageUseCase(
      ChipMessageParams(
        currentMessage: state.messageContent ?? '',
        chip: event.chip,
      ),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(error: failure.toString()));
      },
      (newMessageContent) {
        _controller.text = newMessageContent;
        emit(state.copyWith(messageContent: newMessageContent, error: null));
      },
    );
  }

  Future<void> _onSendMessageEvent(
    _SendMessage event,
    Emitter<ChatState> emit,
  ) async {
    if (event.messageContent.trim().isEmpty) {
      return;
    }

    emit(state.copyWith(isSending: true, error: null));

    final message = await createMessageUseCase(event.messageContent, user.id);

    final params = SendMessageParams(
      messageContent: event.messageContent,
      senderId: user.id,
    );

    final result = await sendMessageUseCase(params);

    print(result);

    result.fold(
      (failure) {
        emit(state.copyWith(isSending: false, error: failure.toString()));
      },
      (_) {
        _controller.clear();
        emit(state.copyWith(isSending: false, messageContent: '', error: null));
      },
    );
  }

  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    _controller.dispose();
    return super.close();
  }
}
