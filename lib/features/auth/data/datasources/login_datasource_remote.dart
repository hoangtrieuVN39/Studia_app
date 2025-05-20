import 'dart:math';

import 'package:studia/core/constants.dart';
import 'package:studia/core/network/api_client.dart';
import 'package:studia/core/error/exceptions.dart';
import 'package:studia/features/auth/data/models/user_model.dart';

class LoginDatasourceRemote {
  final ApiClient apiClient;

  LoginDatasourceRemote({required this.apiClient});

  Future<UserModel?> getUser(String userId) async {
    try {
      print('Attempting to get user with ID: $userId');
      print('Using API endpoint: ${ApiConstants.baseUrl}${ApiConstants.login}');

      final data = {'user_id': userId};
      print('Request data: $data');

      final jsonData = await apiClient.post(ApiConstants.login, data: data);
      print('Response received: $jsonData');

      return UserModel.fromJson(jsonData.data);
    } catch (e) {
      print('Error getting user: $e');
      if (e is NetworkException) {
        print('Network error details: ${e.message}');
        rethrow;
      }
      if (e is ServerException) {
        print('Server error details: ${e.message}');
        rethrow;
      }
      throw Exception('Failed to get user: $e');
    }
  }

  Future<bool> register(Map<String, dynamic> data) async {
    try {
      print('Attempting to register user');
      print('Using API endpoint: ${ApiConstants.baseUrl}/users');
      print('Registration data: $data');

      await apiClient.post('/users', data: data);
      print('Registration successful');
      return true;
    } catch (e) {
      print('Registration error: $e');
      if (e is NetworkException || e is ServerException) {
        rethrow;
      }
      throw Exception('Failed to register user: $e');
    }
  }
}
