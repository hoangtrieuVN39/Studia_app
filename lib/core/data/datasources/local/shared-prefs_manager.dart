import 'package:shared_preferences/shared_preferences.dart';
import 'package:studia/core/util/input_validator.dart';
import 'package:injectable/injectable.dart';

@injectable
class SharedPrefsManager {
  SharedPreferences? _sharedPreferences;

  SharedPrefsManager(this._sharedPreferences);

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Getter to access SharedPreferences instance
  SharedPreferences get prefs {
    if (_sharedPreferences == null) {
      throw StateError(
        'SharedPrefsManager not initialized. Call getInstance() first.',
      );
    }
    return _sharedPreferences!;
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

@module
abstract class SharedPrefsModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
