import 'package:shared_preferences/shared_preferences.dart';

class LoginDatasourceLocal {
  final SharedPreferences prefs;

  LoginDatasourceLocal({required SharedPreferences prefs}) : prefs = prefs;

  Future<Map<String, dynamic>> getUser() async {
    try {
      final id = await prefs.getString('user_id');
      final email = await prefs.getString('user_email');
      final isNewUser = await prefs.getBool('user_isNewUser');
      return {'id': id, 'email': email, 'isNewUser': isNewUser};
    } catch (e) {
      return {'id': '', 'email': '', 'isNewUser': true};
    }
  }

  Future<void> saveUser(String id, String email, bool isNewUser) async {
    await prefs.setString('user_id', id);
    await prefs.setString('user_email', email);
    await prefs.setBool('user_isNewUser', isNewUser);
  }

  Future<void> removeUser() async {
    await prefs.remove('user_id');
    await prefs.remove('user_email');
    await prefs.remove('user_isNewUser');
  }
}

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException(this.message);
}
