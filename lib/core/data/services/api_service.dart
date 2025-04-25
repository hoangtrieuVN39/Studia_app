import 'package:studia/core/data/services/dio_service.dart';

class RestAPIService {
  final _dio = DioService().dio;

  Future<dynamic> get(String url) async {
    return await _dio.get(url);
  }

  Future<dynamic> post(String url, dynamic data) async {
    return await _dio.post(url, data: data);
  }
}
