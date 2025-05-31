import 'package:studia/core/constants/language_constants.dart';
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart';

class LoginDatasourceLocal {
  final SharedPrefsManager prefs;

  LoginDatasourceLocal({required SharedPrefsManager prefs}) : prefs = prefs;

  Future<Map<String, dynamic>> getUser() async {
    try {
      final id = await prefs.get('user_id');
      final email = await prefs.get('user_email');
      return {'id': id, 'email': email};
    } catch (e) {
      return {'id': '', 'email': ''};
    }
  }

  Future<void> saveUser(String id, String email) async {
    prefs.save('user_id', id);
    prefs.save('user_email', email);
  }

  Future<void> removeUser() async {
    prefs.remove('user_id');
    prefs.remove('user_email');
  }

  Future<Language> getLanguage() async {
    final language = await prefs.get('language');
    return Language.values.firstWhere(
      (e) => e.name == language,
      orElse: () => Language.vi,
    );
  }
}

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException(this.message);
}
