import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/core/error/failures.dart' hide Failure;
import 'package:studia/core/domain/usecases/websocket/connect_websocket.dart';
import 'package:studia/core/domain/usecases/websocket/disconnect_websocket.dart';
import 'package:studia/core/domain/usecases/websocket/get_websocket_stream.dart';
import 'package:studia/core/domain/usecases/websocket/send_websocket_message.dart';
import 'package:studia/features/chat/data/models/message_model.dart';
import 'package:studia/features/chat/domain/entities/message.dart';
import 'package:studia/features/chat/domain/usecases/chip_message.dart';
import 'package:studia/features/chat/domain/usecases/create_message.dart';
import 'package:studia/features/chat/domain/usecases/get_messages_usecase.dart';
import 'package:studia/main.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChipMessage chipMessageUseCase;
  final CreateMessage createMessageUseCase;
  final ConnectWebSocket connectWebSocketUseCase;
  final DisconnectWebSocket disconnectWebSocketUseCase;
  final SendWebSocketMessage sendWebSocketMessageUseCase;
  final GetWebSocketStream getWebSocketStreamUseCase;
  final User user;
  final String websocketUrl;
  final GetMessagesUsecase getMessagesUseCase;

  StreamSubscription? _messageSubscription;
  bool _isClosed = false;

  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  String get userName => user.firstName;

  ChatBloc({
    required this.websocketUrl,
    required this.chipMessageUseCase,
    required this.createMessageUseCase,
    required this.connectWebSocketUseCase,
    required this.disconnectWebSocketUseCase,
    required this.sendWebSocketMessageUseCase,
    required this.getWebSocketStreamUseCase,
    required this.getMessagesUseCase,
    required this.user,
  }) : super(const ChatState()) {
    on<_Initial>(_onInitialEvent);
    on<_TextChanged>(_onTextChangedEvent);
    on<_SendMessage>(_onSendMessageEvent);
    on<_ClickChip>(_onClickChipEvent);
    on<_MessageReceived>(_onMessageReceivedEvent);

    _initializeWebSocket();
    add(const _Initial());
  }

  void _initializeWebSocket() {
    if (_isClosed) return;

    print("ChatBloc: Initializing WebSocket connection");
    connectWebSocketUseCase(websocketUrl).then((result) {
      result.fold(
        (failure) {
          if (!_isClosed) {
            print("ChatBloc: WebSocket connection failed: ${failure.message}");
            emit(state.copyWith(error: failure.toString()));
          }
        },
        (_) {
          if (_isClosed) return;
          print("ChatBloc: WebSocket connected, setting up message stream");

          // Cancel existing subscription if any
          _messageSubscription?.cancel();

          _messageSubscription = getWebSocketStreamUseCase().listen(
            (messageResult) {
              if (_isClosed) return;
              messageResult.fold(
                (failure) {
                  print("ChatBloc: Message stream error: ${failure.message}");
                  if (!_isClosed) {
                    emit(state.copyWith(error: failure.toString()));
                  }
                },
                (messageStr) {
                  if (_isClosed) return;
                  print("ChatBloc: Message received from stream");
                  _processMessage(messageStr);
                },
              );
            },
            onError: (error) {
              print("ChatBloc: Message stream error: $error");
              if (!_isClosed) {
                emit(state.copyWith(error: "WebSocket stream error: $error"));
              }
            },
            cancelOnError: false,
          );
        },
      );
    });
  }

  void _processMessage(String messageStr) {
    if (_isClosed) return;

    try {
      print("ChatBloc: Received raw message: $messageStr");

      Map<String, dynamic> messageData = {};

      // Try parsing the message directly as JSON first
      try {
        messageData = jsonDecode(messageStr)['data'];
        print("ChatBloc: Successfully parsed as direct JSON");
      } catch (e) {
        print("ChatBloc: Failed to parse as direct JSON: $e");
      }

      if (!_isClosed) {
        add(ChatEvent.messageReceived(messages: messageData));
      }
    } catch (e) {
      print("ChatBloc: Error processing message: $e");
    }
  }

  void _scrollToBottom(Emitter<ChatState> emit) {
    emit(state.copyWith(isLoading: true));
    if (_scrollController.hasClients && !_isClosed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients && !_isClosed) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onInitialEvent(_Initial event, Emitter<ChatState> emit) async {
    final messageChips = [
      getIt.get<AppTextConstants>().help,
      getIt.get<AppTextConstants>().giveAdvice,
      getIt.get<AppTextConstants>().howToUse,
      getIt.get<AppTextConstants>().canILearnThis,
    ];
    emit(
      state.copyWith(isLoading: true, error: null, messageChips: messageChips),
    );
    final result = await getMessagesUseCase();
    result.fold(
      (failure) {
        emit(state.copyWith(error: failure.toString()));
      },
      (messages) {
        emit(state.copyWith(isLoading: false, messageHistory: messages));
        _scrollToBottom(emit);
      },
    );
  }

  Future<void> _onMessageReceivedEvent(
    _MessageReceived event,
    Emitter<ChatState> emit,
  ) async {
    if (_isClosed) return;

    try {
      print("ChatBloc: Processing received messages: ${event.messages}");

      final Message message = MessageModel.fromJson(event.messages);

      print("ChatBloc: Created message objects: $message");

      if (!_isClosed) {
        emit(
          state.copyWith(
            messageHistory: [...state.messageHistory, message],
            error: null,
          ),
        );
        _scrollToBottom(emit);
      }
    } catch (e) {
      print("ChatBloc: Error processing received messages: $e");
      if (!_isClosed) {
        emit(state.copyWith(error: "Failed to process received messages: $e"));
      }
    }
  }

  Future<void> _onTextChangedEvent(
    _TextChanged event,
    Emitter<ChatState> emit,
  ) async {
    if (_isClosed) return;
    emit(state.copyWith(messageContent: event.text));
  }

  Future<void> _onClickChipEvent(
    _ClickChip event,
    Emitter<ChatState> emit,
  ) async {
    if (_isClosed) return;

    final result = await chipMessageUseCase(
      ChipMessageParams(
        currentMessage: state.messageContent ?? '',
        chip: event.chip,
      ),
    );

    if (_isClosed) return;

    result.fold(
      (failure) {
        if (!_isClosed && !emit.isDone) {
          emit(state.copyWith(error: failure.toString()));
        }
      },
      (newMessageContent) {
        _controller.text = newMessageContent;
        if (!_isClosed && !emit.isDone) {
          emit(state.copyWith(messageContent: newMessageContent, error: null));
        }
      },
    );
  }

  Future<void> _onSendMessageEvent(
    _SendMessage event,
    Emitter<ChatState> emit,
  ) async {
    if (event.messageContent.trim().isEmpty || _isClosed || emit.isDone) return;

    emit(state.copyWith(isSending: true, error: null));

    try {
      final message = await createMessageUseCase(event.messageContent, user.id);

      if (_isClosed) return;

      final sendResult = await sendWebSocketMessageUseCase(
        jsonEncode(message.toJson()),
      );

      if (_isClosed) return;

      sendResult.fold(
        (failure) {
          if (!_isClosed && !emit.isDone) {
            emit(
              state.copyWith(
                isSending: false,
                error: "Failed to send message: ${failure.message}",
              ),
            );
          }
        },
        (_) {
          _controller.clear();
          if (!_isClosed && !emit.isDone) {
            emit(
              state.copyWith(isSending: false, messageContent: '', error: null),
            );
            _scrollToBottom(emit);
          }
        },
      );
    } catch (e) {
      print("ChatBloc: Error sending message: $e");
      if (!_isClosed && !emit.isDone) {
        emit(
          state.copyWith(isSending: false, error: "Failed to send message: $e"),
        );
      }
    }
  }

  @override
  Future<void> close() async {
    print("ChatBloc: Closing");
    _isClosed = true;
    await _messageSubscription?.cancel();
    await disconnectWebSocketUseCase();
    _controller.dispose();
    _scrollController.dispose();
    return super.close();
  }
}
