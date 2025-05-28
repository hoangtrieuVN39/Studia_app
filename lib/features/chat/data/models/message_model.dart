import 'package:studia/features/chat/domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel({
    required super.content,
    required super.createdAt,
    required super.userId,
    required super.isUser,
  });

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'created_at': createdAt.toIso8601String(),
      'user_id': userId,
      'is_user': isUser,
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at']),
      userId: json['user_id'] as String,
      isUser: json['is_user'] == 1,
    );
  }
}
