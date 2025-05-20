import 'dart:io';

class ApiConstants {
  static String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8000';
    }
    return 'http://127.0.0.1:8000';
  }

  static const String login = '/login';
  static const String register = '/register';
  static const String logout = '/logout';
  static const String account = '/account';
  static const String courses = '/standards';
  static const String messages = '/messages';
  static const String message = '/message';
  static const String questions = '/questions';
}
