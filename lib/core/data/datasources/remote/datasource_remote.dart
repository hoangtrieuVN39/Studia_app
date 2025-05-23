import 'package:http/http.dart' as http;

abstract class DatasourceRemote {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, dynamic body);
  Future<dynamic> put(String url, dynamic body);
  Future<dynamic> delete(String url);
}
