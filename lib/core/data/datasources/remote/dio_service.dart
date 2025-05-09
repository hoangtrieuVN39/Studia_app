import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class DioService {
  late final Dio _dio;

  DioService({required String baseUrl}) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    _dio = Dio(options);
  }

  @preResolve
  Dio get dio => _dio;
}
