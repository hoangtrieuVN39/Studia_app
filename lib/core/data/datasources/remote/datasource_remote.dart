import 'package:dio/dio.dart';

class DatasourceRemote {
  final Dio _dio;

  DatasourceRemote({required Dio dio}) : _dio = dio;

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, dynamic data) async {
    return await _dio.post(url, data: data);
  }

  Future<Response> put(String url, dynamic data) async {
    return await _dio.put(url, data: data);
  }

  Future<Response> delete(String url) async {
    return await _dio.delete(url);
  }
}