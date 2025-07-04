import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:studia/core/constants.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/core/error/exceptions.dart';

class ApiClient extends DatasourceRemote {
  final Dio dio;

  ApiClient(this.dio);

  @override
  Future<dynamic> get(String url, {dynamic body}) async {
    try {
      final headers = Options(headers: {'Content-Type': 'application/json'});
      final response = await dio.get(
        'http://${ApiConstants.baseUrl}$url',
        queryParameters: body,
        options: headers,
      );
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  @override
  Future<dynamic> post(String url, {dynamic body}) async {
    try {
      dynamic encodedData = body;
      final headers = Options(headers: {'Content-Type': 'application/json'});
      if ((body is Map || body is List) &&
          headers.headers?['Content-Type'] == 'application/json') {
        encodedData = jsonEncode(body);
      }
      final response = await dio.post(
        'http://${ApiConstants.baseUrl}$url',
        data: encodedData,
        options: headers,
      );
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  @override
  Future<dynamic> put(String url, {dynamic body}) async {
    try {
      dynamic encodedData = body;
      final headers = Options(headers: {'Content-Type': 'application/json'});
      if ((body is Map || body is List) &&
          headers.headers?['Content-Type'] == 'application/json') {
        encodedData = jsonEncode(body);
      }
      final response = await dio.put(
        'http://${ApiConstants.baseUrl}$url',
        data: encodedData,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> delete(String url) async {
    try {
      final headers = Options(headers: {'Content-Type': 'application/json'});
      final response = await dio.delete(
        'http://${ApiConstants.baseUrl}$url',
        options: headers,
      );
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
        'Connection refused: Please ensure the server is running at http://${ApiConstants.baseUrl}',
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
