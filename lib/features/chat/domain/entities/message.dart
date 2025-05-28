class Message {
  final String content;
  final DateTime createdAt;
  final String userId;
  final bool isUser;

  Message({
    required this.content,
    required this.createdAt,
    required this.userId,
    required this.isUser,
  });
}
