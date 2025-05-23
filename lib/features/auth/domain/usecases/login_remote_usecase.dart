import 'package:google_sign_in/google_sign_in.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_remote.dart';

class LoginRemoteUsecase {
  final LoginRepositoryRemote loginRepositoryRemote;
  final LoginRepositoryLocal loginRepositoryLocal;

  LoginRemoteUsecase({
    required this.loginRepositoryRemote,
    required this.loginRepositoryLocal,
  });

  Future<User?> call(String id) async {
    var user = await loginRepositoryRemote.getUser(id);
    if (user != null) {
      await loginRepositoryLocal.saveUser(user.id.toString(), user.email);
      print('User saved: ${user.id}');
      return user;
    } else {
      return null;
    }
  }
}
