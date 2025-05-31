import 'dart:convert';

import 'package:studia/features/chat/data/datasources/chat_remote_data_source_impl.dart';
import 'package:studia/features/chat/data/models/message_model.dart';
import 'package:studia/features/chat/domain/entities/message.dart';
import 'package:studia/features/chat/domain/repositories/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  final ChatRemoteDataSource remoteDataSource;

  MessageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Message>> getMessages(String userId) async {
    try {
      final List<Message> messages = await remoteDataSource.getMessages(userId);
      return messages;
    } catch (e) {
      print('Error parsing message from WebSocket: $e');
      throw Exception(e);
    }
  }
}
