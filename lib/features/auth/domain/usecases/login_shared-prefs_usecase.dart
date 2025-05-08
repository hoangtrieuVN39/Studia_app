import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';

class LoginSharedPrefsUsecase {
  final LoginRepositoryLocal loginRepositoryLocal;

  LoginSharedPrefsUsecase({required this.loginRepositoryLocal});

  Future<Map<String, dynamic>?> call() async {
    var userLocal = await loginRepositoryLocal.getUser();
    final id = userLocal['id'];
    final email = userLocal['email'];
    final isNewUser = userLocal['isNewUser'];
    if (id != null) {
      return {'id': id, 'email': email, 'newUser': isNewUser};
    }
    return null;
  }
}
