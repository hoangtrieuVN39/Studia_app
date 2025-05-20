import 'package:studia/features/chat/domain/entities/message.dart';

abstract class MessageRepository {
  Future<void> sendMessage(
    String messageContent,
    String senderId,
    String groupId,
  );
  Stream<Message> getMessageStream(String groupId);
}
