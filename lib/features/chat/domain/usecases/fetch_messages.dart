import 'package:studia/features/chat/domain/entities/message.dart';
import 'package:studia/features/chat/domain/repositories/message_repository.dart';

class FetchMessages {
  final MessageRepository messageRepository;

  FetchMessages({required this.messageRepository});

  Future<List<Message>> call(String group) async {
    return [];
  }
}

