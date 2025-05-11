import 'package:google_sign_in/google_sign_in.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_remote.dart';

class LoginRemoteUsecase {
  final LoginRepositoryLocal loginRepositoryLocal;
  final LoginRepositoryRemote loginRepositoryRemote;

  LoginRemoteUsecase({
    required this.loginRepositoryLocal,
    required this.loginRepositoryRemote,
  });

  Future<User?> call(String id) async {
    var user = await loginRepositoryRemote.getUser(id);
    if (user != null) {
      await loginRepositoryLocal.saveUser(
        user.id.toString(),
        user.email,
        false,
      );
      return user;
    } else {
      return null;
    }
  }
}
