import 'package:studia/core/di/provider.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';

class GetLanguageUsecase {
  final LoginRepositoryLocal loginRepositoryLocal;
  final LanguageProvider languageProvider;

  GetLanguageUsecase(this.loginRepositoryLocal, this.languageProvider);

  Future<void> call() async {
    final language = await loginRepositoryLocal.getLanguage();
    languageProvider.setLanguage(language);
  }
}
