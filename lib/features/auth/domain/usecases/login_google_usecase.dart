import 'package:google_sign_in/google_sign_in.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_remote.dart';

class LoginGoogleUsecase {
  final GoogleSignIn googleSignIn;

  LoginGoogleUsecase({GoogleSignIn? googleSignIn})
    : googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<GoogleSignInAccount?> call() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    return googleUser;
  }
}
