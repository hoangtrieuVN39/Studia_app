import 'package:google_sign_in/google_sign_in.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_remote.dart';

class LoginUsecase {
  final LoginRepositoryLocal loginRepositoryLocal;
  final LoginRepositoryRemote loginRepositoryRemote;
  final GoogleSignIn googleSignIn;

  LoginUsecase({
    required this.loginRepositoryLocal,
    required this.loginRepositoryRemote,
    GoogleSignIn? googleSignIn,
  }) : this.googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<Map<String, String>> call() async {
    var user = await loginRepositoryLocal.getUser();
    if (user != null) {
      return {'id': user.id.toString(), 'email': user.email};
    }
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    user = await loginRepositoryRemote.getUser(googleUser!.id);
    if (user != null) {
      return {
        'id': user.id.toString(),
        'email': user.email,
        'newUser': 'false',
      };
    } else {
      return {
        'id': googleUser.id,
        'email': googleUser.email,
        'newUser': 'true',
      };
    }
  }
}
