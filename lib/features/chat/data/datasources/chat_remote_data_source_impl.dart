import 'package:studia/core/constants/api_constants.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/features/chat/data/models/message_model.dart';
import 'package:studia/features/chat/domain/entities/message.dart';

abstract class ChatRemoteDataSource {
  Future<List<Message>> getMessages(String userId);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final DatasourceRemote datasourceRemote;

  ChatRemoteDataSourceImpl({required this.datasourceRemote});

  Future<List<Message>> getMessages(String userId) async {
    try {
      final jsonData = await datasourceRemote.get(ApiConstants.messages);
      final List<Message> messages = [];
      for (var rawMessageMap in jsonData) {
        messages.add(MessageModel.fromJson(rawMessageMap));
      }
      return messages;
    } catch (e) {
      throw Exception(e);
    }
  }
}
