import 'dart:convert';

import 'package:studia/core/data/datasources/local/datasource_local.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/data/models/user_model.dart';

class LoginDatasourceLocal {
  final DatasourceLocal datasourceLocal;
  LoginDatasourceLocal({required this.datasourceLocal});

  Future<User> getUser() async {
    try {
      final user = await datasourceLocal.getInstance('user');
      return UserModel.fromJson(jsonDecode(user));
    } catch (e) {
      throw UserNotFoundException(e.toString());
    }
  }

  Future<void> saveUser(User user) async {
    final userModel = UserModel.copyWith(user);
    await datasourceLocal.saveInstance('user', userModel.toJson());
  }
}

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException(this.message);
}
