class Message {
  final String content;
  final String createdAt;
  final String userId;
  final bool isUser;

  Message({
    required this.content,
    required this.createdAt,
    required this.userId,
    required this.isUser,
  });
}
