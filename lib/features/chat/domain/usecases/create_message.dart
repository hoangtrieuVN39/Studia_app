import 'package:studia/features/chat/domain/entities/message.dart';

class CreateMessage {
  CreateMessage();

  Future<Message> call(String message, String user) async {
    return Message(
      content: message,
      createdAt: DateTime.now().toIso8601String(),
      userId: user,
      isUser: true,
    );
  }
}