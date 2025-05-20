import 'package:dio/dio.dart';
import 'package:studia/core/constants.dart';
import 'package:studia/core/error/exceptions.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio});

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        '${ApiConstants.baseUrl}$url',
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> post(String url, {dynamic data}) async {
    try {
      final response = await dio.post(
        '${ApiConstants.baseUrl}$url',
        data: data,
      );
      print('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      print('API Error: ${e.type} - ${e.message}');
      print('Attempted URL: ${ApiConstants.baseUrl}$url');
      print('Request Data: $data');
      if (e.response != null) {
        print('Response Status: ${e.response?.statusCode}');
        print('Response Data: ${e.response?.data}');
      }
      if (e.error != null) {
        print('Error details: ${e.error}');
      }
      _handleError(e);
    }
  }

  Future<dynamic> put(String url, {dynamic data}) async {
    try {
      final response = await dio.put('${ApiConstants.baseUrl}$url', data: data);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> delete(String url) async {
    try {
      final response = await dio.delete('${ApiConstants.baseUrl}$url');
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  void _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      throw NetworkException(
        'Connection timeout: Please check your internet connection',
      );
    } else if (e.type == DioExceptionType.connectionError) {
      throw NetworkException(
        'Connection refused: Please ensure the server is running at ${ApiConstants.baseUrl}',
      );
    } else if (e.response != null) {
      final statusCode = e.response?.statusCode;
      final responseData = e.response?.data;
      if (statusCode == 500) {
        throw ServerException(
          'Internal Server Error (500): ${responseData ?? "No error details available"}',
        );
      }
      throw ServerException(
        'Server Error (${statusCode}): ${responseData ?? "No error details available"}',
      );
    } else {
      throw Exception('Network error: ${e.message}');
    }
  }
}
