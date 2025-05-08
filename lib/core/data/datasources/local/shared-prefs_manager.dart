import 'package:shared_preferences/shared_preferences.dart';
import 'package:studia/core/util/input_validator.dart';

class SharedPrefsManager {
  SharedPrefsManager? _instance;
  SharedPreferences? _sharedPreferences;

  // Private constructor
  SharedPrefsManager(this._sharedPreferences);

  // Getter to access SharedPreferences instance
  SharedPreferences get prefs {
    if (_sharedPreferences == null) {
      throw StateError(
        'SharedPrefsManager not initialized. Call getInstance() first.',
      );
    }
    return _sharedPreferences!;
  }

  // Initialize in app startup
  Future<void> init() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  void save(String key, dynamic value) {
    Type? type = InputValidator.checkType(value);
    if (value == null) {
      prefs.remove(key);
    } else if (type == String) {
      prefs.setString(key, value);
    } else if (type == int) {
      prefs.setInt(key, value);
    } else if (type == double) {
      prefs.setDouble(key, value);
    } else if (type == bool) {
      prefs.setBool(key, value);
    } else if (type == List<String>) {
      prefs.setStringList(key, value);
    } else {
      throw ArgumentError(
        'Unsupported type for SharedPreferences: ${value.runtimeType}',
      );
    }
  }

  dynamic get(String key) {
    return prefs.get(key);
  }

  void remove(String key) {
    prefs.remove(key);
  }

  void clear() {
    prefs.clear();
  }
}
