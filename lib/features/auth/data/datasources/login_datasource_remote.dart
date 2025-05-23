import 'dart:math';

import 'package:studia/core/constants.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/core/network/api_client.dart';
import 'package:studia/core/error/exceptions.dart';
import 'package:studia/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<UserModel?> getUser(String userId);
  Future<bool> register(Map<String, dynamic> data);
}

class LoginDatasourceRemoteImpl implements LoginRemoteDataSource {
  final DatasourceRemote datasourceRemote;

  LoginDatasourceRemoteImpl({required this.datasourceRemote});

  Future<UserModel?> getUser(String userId) async {
    // try {
    //   print('Attempting to get user with ID: $userId');
    //   print('Using API endpoint: ${ApiConstants.baseUrl}${ApiConstants.login}');

    //   final data = {'user_id': userId};
    //   print('Request data: $data');

    //   final jsonData = await datasourceRemote.post(ApiConstants.login, data);
    //   print('Response received: $jsonData');

    //   return UserModel.fromJson(jsonData.data);
    // } catch (e) {
    //   print('Error getting user: $e');
    //   if (e is NetworkException) {
    //     print('Network error details: ${e.message}');
    //     rethrow;
    //   }
    //   if (e is ServerException) {
    //     print('Server error details: ${e.message}');
    //     rethrow;
    //   }
    //   throw Exception('Failed to get user: $e');
    // }
    // return null;

    return getUserMock();
  }

  Future<bool> register(Map<String, dynamic> data) async {
    //   try {
    //     print('Attempting to register user');
    //     print('Using API endpoint: ${ApiConstants.baseUrl}/users');
    //     print('Registration data: $data');

    //     await datasourceRemote.post(ApiConstants.login, data);
    //     print('Registration successful');
    //     return true;
    //   } catch (e) {
    //     print('Registration error: $e');
    //     if (e is NetworkException || e is ServerException) {
    //       rethrow;
    //     }
    //     throw Exception('Failed to register user: $e');
    //   }
    // }
    return true;
  }
}

UserModel getUserMock() {
  return UserModel.fromJson({
    'id': '1',
    'email': 'test@test.com',
    'firstName': 'Test',
    'lastName': 'Test',
    'gender': 'male',
    'avatar': '',
    'birthYear': 1990,
    'performance': [for (var i = 0; i < 484; i++) Random().nextDouble()],
    'levelId': 0,
  });
}
