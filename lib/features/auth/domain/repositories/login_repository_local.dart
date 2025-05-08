import 'package:studia/core/domain/entities/user.dart';

abstract class LoginRepositoryLocal {
  Future<Map<String, dynamic>> getUser();
  Future<void> saveUser(String id, String email, bool isNewUser);
  Future<void> removeUser();
}
