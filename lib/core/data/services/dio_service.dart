import 'package:dio/dio.dart';

class DioService {
  late final Dio _dio;

  DioService() {
    final options = BaseOptions(
      baseUrl: 'https://api.example.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    _dio = Dio(options);
  }

  Dio get dio => _dio;
}
