import 'package:studia/features/chat/data/models/message_model.dart';

class CreateMessage {
  CreateMessage();

  Future<MessageModel> call(String message, String user) async {
    return MessageModel(
      content: message,
      createdAt: DateTime.now(),
      userId: user,
      isUser: true,
    );
  }
}
