import 'package:shared_preferences/shared_preferences.dart';
import 'package:studia/core/util/input_validator.dart';

class DatasourceLocal {
  final SharedPreferences _sharedPreferences;

  DatasourceLocal({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  Future<void> saveInstance(String key, dynamic value) async {
    Type? type = InputValidator.checkType(value);
    if (value == null) {
      await _sharedPreferences.remove(key);
    } else if (type == String) {
      await _sharedPreferences.setString(key, value);
    } else if (type == int) {
      await _sharedPreferences.setInt(key, value);
    } else if (type == double) {
      await _sharedPreferences.setDouble(key, value);
    } else if (type == bool) {
      await _sharedPreferences.setBool(key, value);
    } else if (type == List<String>) {
      await _sharedPreferences.setStringList(key, value);
    } else {
      throw ArgumentError(
        'Unsupported type for SharedPreferences: ${value.runtimeType}',
      );
    }
  }

  Future<String> getInstance(String key) async {
    return _sharedPreferences.getString(key) ?? '';
  }

  Future<void> removeInstance(String key) async {
    await _sharedPreferences.remove(key);
  }

  Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}
