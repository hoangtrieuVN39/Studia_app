import 'package:studia/core/constants/language_constants.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/features/settings/domain/repositories/settings_repository_local.dart';

class UpdateLanguageUsecase {
  final LanguageProvider languageProvider;
  final SettingsRepositoryLocal settingsRepositoryLocal;

  UpdateLanguageUsecase(this.languageProvider, this.settingsRepositoryLocal);

  Future<void> call(Language language) async {
    languageProvider.setLanguage(language);
    await settingsRepositoryLocal.saveLanguage(language);
  }
}
