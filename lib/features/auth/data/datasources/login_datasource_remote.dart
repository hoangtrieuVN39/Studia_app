// ignore: unused_import
import 'dart:math';

import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/core/domain/entities/user.dart';

class LoginDatasourceRemote {
  final DatasourceRemote datasourceRemote;

  LoginDatasourceRemote({required this.datasourceRemote});

  Future<User?> getUser(String userId) async {
    // final response = await datasourceRemote.get('/users/$userId');
    // return UserModel.fromJson(response.data);

    return User(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      gender: 'male',
      email: 'john.doe@example.com',
      avatar: 'https://via.placeholder.com/150',
      level: 4,
      birthYear: 1990,
      performance: [
        for (var i = 0; i < 300; i++)
          [for (var j = 0; j < 4; j++) Random().nextDouble()],
      ],
    );
    return null;
  }

  Future<void> register(Map<String, dynamic> data) async {
    // await datasourceRemote.post('/users', data);
  }
}
