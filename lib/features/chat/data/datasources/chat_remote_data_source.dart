abstract class ChatRemoteDataSource {
  Future<void> sendMessage(String messageJson);
  Stream<List<Map<String, dynamic>>> getMessageStream();
  Future<void> connect();
  Future<void> disconnect();
}
