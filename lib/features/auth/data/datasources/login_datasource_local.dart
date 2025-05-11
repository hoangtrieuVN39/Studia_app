import 'package:shared_preferences/shared_preferences.dart';
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart';

class LoginDatasourceLocal {
  final SharedPrefsManager prefs;

  LoginDatasourceLocal({required SharedPrefsManager prefs}) : prefs = prefs;

  Future<Map<String, dynamic>> getUser() async {
    try {
      final id = await prefs.get('user_id');
      final email = await prefs.get('user_email');
      final isNewUser = await prefs.get('user_isNewUser');
      return {'id': id, 'email': email, 'isNewUser': isNewUser};
    } catch (e) {
      return {'id': '', 'email': '', 'isNewUser': true};
    }
  }

  Future<void> saveUser(String id, String email, bool isNewUser) async {
    prefs.save('user_id', id);
    prefs.save('user_email', email);
    prefs.save('user_isNewUser', isNewUser);
  }

  Future<void> removeUser() async {
    prefs.remove('user_id');
    prefs.remove('user_email');
    prefs.remove('user_isNewUser');
  }
}

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException(this.message);
}
