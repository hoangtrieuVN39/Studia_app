import 'package:studia/features/chat/domain/entities/message.dart';

abstract class MessageRepository {
  Future<List<Message>> getMessages(String userId);
}
