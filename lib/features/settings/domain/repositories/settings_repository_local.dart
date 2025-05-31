import 'package:studia/core/constants/language_constants.dart';

abstract class SettingsRepositoryLocal {
  Future<void> saveLanguage(Language language);
}
