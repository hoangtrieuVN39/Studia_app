part of 'chat_bloc.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    // @Default([]) List<Message> messages,
  }) = _ChatState;
}
