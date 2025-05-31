import 'package:studia/core/constants/language_constants.dart';

abstract class LoginRepositoryLocal {
  Future<Map<String, dynamic>> getUser();
  Future<void> saveUser(String id, String email);
  Future<void> removeUser();
  Future<Language> getLanguage();
}
