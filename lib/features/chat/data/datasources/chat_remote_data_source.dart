import 'package:studia/features/chat/domain/entities/message.dart';

abstract class ChatRemoteDataSource {
  Future<void> sendMessage(String messageJson); // Sends a JSON string message
  Stream<Map<String, dynamic>> getMessageStream(
    String groupId,
  ); // Receives raw JSON objects
  Future<void> connect(String groupId); // To initiate connection if needed
  Future<void> disconnect(); // To close connection
}
