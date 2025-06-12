import 'package:studia/core/constants/language_constants.dart';
import 'package:studia/core/constants/text_constants.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import 'package:studia/main.dart';

class UserProvider {
  User? _user;
  User? get user => _user;

  UserProvider();

  void setUser(User user) {
    _user = user;
  }
}

class LanguageProvider {
  Language _language = Language.en;
  Language get language => _language;

  LanguageProvider();

  void setLanguage(Language language) {
    _language = language;
  }
}

@module
abstract class UserModule {
  @preResolve
  @lazySingleton
  Future<UserProvider> get userProvider async => UserProvider();
}

@module
abstract class AppDatabaseModule {
  @preResolve
  @lazySingleton
  Future<AppDatabase> get appDatabase async => AppDatabase();
}

@module
abstract class LanguageModule {
  @preResolve
  @lazySingleton
  Future<LanguageProvider> get languageProvider async => LanguageProvider();
}

@module
abstract class AppTextConstantsModule {
  @preResolve
  @lazySingleton
  Future<AppTextConstants> get appTextConstants async =>
      AppTextConstants(getIt<LanguageProvider>());
}
