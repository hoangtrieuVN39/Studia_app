import 'package:studia/features/chat/data/models/message_model.dart';
import 'package:studia/features/chat/domain/entities/message.dart';

abstract class MessageRepository {
  Future<void> sendMessage(MessageModel message);
  Stream<List<Message>> getMessageStream();
}
