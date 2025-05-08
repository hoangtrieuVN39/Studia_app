import 'package:dio/dio.dart';

class RestAPIService {
  final Dio dio;
  RestAPIService({required this.dio});

  Future<dynamic> get(String url) async {
    return await dio.get(url);
  }

  Future<dynamic> post(String url, dynamic data) async {
    return await dio.post(url, data: data);
  }
}
