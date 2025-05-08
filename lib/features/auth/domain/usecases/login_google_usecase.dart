import 'package:google_sign_in/google_sign_in.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_remote.dart';

class LoginGoogleUsecase {
  final LoginRepositoryLocal loginRepositoryLocal;
  final LoginRepositoryRemote loginRepositoryRemote;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  LoginGoogleUsecase({
    required this.loginRepositoryLocal,
    required this.loginRepositoryRemote,
  });

  Future<Map<String, dynamic>?> call() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    var user = await loginRepositoryRemote.getUser(googleUser!.id);
    if (user != null) {
      await loginRepositoryLocal.saveUser(
        user.id.toString(),
        user.email,
        false,
      );
      return {'id': user.id.toString(), 'email': user.email, 'newUser': false};
    } else {
      await loginRepositoryLocal.saveUser(
        googleUser.id,
        googleUser.email,
        true,
      );
      return {'id': googleUser.id, 'email': googleUser.email, 'newUser': true};
    }
  }
}
