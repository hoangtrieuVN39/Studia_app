import 'dart:convert';

import 'package:studia/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:studia/features/chat/data/models/message_model.dart';
import 'package:studia/features/chat/domain/entities/message.dart';
import 'package:studia/features/chat/domain/repositories/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  final ChatRemoteDataSource remoteDataSource;

  MessageRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<List<Message>> getMessageStream() async* {
    await remoteDataSource.connect();
    await for (final rawMessageMapList in remoteDataSource.getMessageStream()) {
      try {
        yield rawMessageMapList
            .map(
              (rawMessageMap) => Message(
                content: rawMessageMap['content'] as String,
                createdAt: DateTime.parse(rawMessageMap['createdAt'] as String),
                userId: rawMessageMap['userId'] as String,
                isUser: rawMessageMap['isUser'] as bool,
              ),
            )
            .toList();
      } catch (e) {
        print(
          'Error parsing message from WebSocket: $e. Raw data: $rawMessageMapList',
        );
      }
    }
  }

  @override
  Future<void> sendMessage(MessageModel message) async {
    await remoteDataSource.connect();
    try {
      final String messageJsonString = jsonEncode(message.toJson());

      try {
        await remoteDataSource.sendMessage(messageJsonString);
      } catch (e) {
        print('Error sending message via WebSocket: $e');
        rethrow; // Re-throw to be caught by the use case and handled in the BLoC
      }
    } catch (e) {
      print('Error sending message via WebSocket: $e');
      rethrow; // Re-throw to be caught by the use case and handled in the BLoC
    }
  }
}
