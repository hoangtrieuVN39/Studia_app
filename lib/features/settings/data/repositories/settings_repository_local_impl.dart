import 'package:studia/core/constants/language_constants.dart';
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart';
import 'package:studia/features/settings/domain/repositories/settings_repository_local.dart';

class SettingsRepositoryLocalImpl implements SettingsRepositoryLocal {
  final SharedPrefsManager sharedPrefsManager;

  SettingsRepositoryLocalImpl(this.sharedPrefsManager);

  @override
  Future<void> saveLanguage(Language language) async {
    sharedPrefsManager.save('language', language.name);
  }
}
