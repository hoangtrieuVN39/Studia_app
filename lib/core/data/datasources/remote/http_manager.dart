import 'dart:convert';

import 'package:studia/core/constants/api_constants.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;

class HttpManager extends DatasourceRemote {
  final String baseUrl = ApiConstants.baseUrl;
  final http.Client client;

  HttpManager({required this.client});

  @override
  Future delete(String url) async {
    try {
      final response = await client.delete(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future get(String url) async {
    try {
      final response = await client.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future post(String url, body) async {
    final response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  @override
  Future put(String url, body) async {
    try {
      final response = await client.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
