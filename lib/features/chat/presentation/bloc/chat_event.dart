part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.initial({
    @Default('default_group_id') String groupId,
  }) = _Initial;
  const factory ChatEvent.textChanged(String text) = _TextChanged;
  const factory ChatEvent.sendMessage(String messageContent) = _SendMessage;
  const factory ChatEvent.clickChip(String chip) = _ClickChip;
  const factory ChatEvent.messageReceived({
    required Map<String, dynamic> messages,
  }) = _MessageReceived;
}
