import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<Initial>((event, emit) => _onInitialEvent(event, emit));
    add(const Initial());
  }

  Future<void> _onInitialEvent(Initial event, Emitter<ChatState> emit) async {
    emit(state.copyWith(isLoading: true));
  }
}
