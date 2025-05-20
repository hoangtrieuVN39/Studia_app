import 'dart:convert';

import 'package:studia/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:studia/features/chat/domain/entities/message.dart';
import 'package:studia/features/chat/domain/repositories/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  final ChatRemoteDataSource remoteDataSource;

  MessageRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<Message> getMessageStream(String groupId) async* {
    await for (final rawMessageMap in remoteDataSource.getMessageStream(
      groupId,
    )) {
      try {
        // Manual mapping from Map to Message entity
        yield Message(
          content: rawMessageMap['content'] as String,
          createdAt: rawMessageMap['createdAt'] as String,
          userId: rawMessageMap['userId'] as String,
          isUser: rawMessageMap['isUser'] as bool,
        );
      } catch (e) {
        print(
          'Error parsing message from WebSocket: $e. Raw data: $rawMessageMap',
        );
      }
    }
  }

  @override
  Future<void> sendMessage(
    String messageContent,
    String senderId,
    String groupId,
  ) async {
    int userIdAsInt;
    int groupIdAsInt;

    try {
      userIdAsInt = int.parse(senderId);
    } catch (e) {
      print('Error: Could not parse senderId \'$senderId\' to int.');
      throw ArgumentError('Invalid senderId format, expected parsable int.');
    }

    try {
      groupIdAsInt = int.parse(groupId);
    } catch (e) {
      print('Error: Could not parse groupId \'$groupId\' to int.');
      throw ArgumentError('Invalid groupId format, expected parsable int.');
    }

    // Construct the map for JSON encoding based on the Message entity fields
    final Map<String, dynamic> messageJsonMap = {
      'content': messageContent,
      'createdAt': DateTime.now().toIso8601String(),
      'userId': userIdAsInt,
      'groupId': groupIdAsInt,
    };

    final String messageJsonString = jsonEncode(messageJsonMap);

    try {
      await remoteDataSource.sendMessage(messageJsonString);
    } catch (e) {
      print('Error sending message via WebSocket: $e');
      rethrow; // Re-throw to be caught by the use case and handled in the BLoC
    }
  }
}
