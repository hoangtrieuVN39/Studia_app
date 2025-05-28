import 'package:studia/core/constants/api_constants.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';

abstract class ChatRemoteDataSource {
  Future<List<dynamic>> getMessages(String userId);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final DatasourceRemote datasourceRemote;

  ChatRemoteDataSourceImpl({required this.datasourceRemote});

  Future<List<dynamic>> getMessages(String userId) async {
    try {
      final jsonData = await datasourceRemote.get(ApiConstants.messages);
      return jsonData;
    } catch (e) {
      return [];
    }
  }
}
