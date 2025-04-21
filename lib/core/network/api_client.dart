import 'package:dio/dio.dart';
import 'package:studia/core/error/exceptions.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio});

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> post(String url, {dynamic data}) async {
    try {
      final response = await dio.post(url, data: data);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> put(String url, {dynamic data}) async {
    try {
      final response = await dio.put(url, data: data);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> delete(String url) async {
    try {
      final response = await dio.delete(url);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  void _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      throw NetworkException();
    } else if (e.response != null) {
      throw ServerException();
    } else {
      throw Exception('Something went wrong');
    }
  }
}
