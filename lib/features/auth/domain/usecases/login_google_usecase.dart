import 'package:google_sign_in/google_sign_in.dart';

class LoginGoogleUsecase {
  final GoogleSignIn googleSignIn;

  LoginGoogleUsecase({GoogleSignIn? googleSignIn})
    : googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<GoogleSignInAccount?> call() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    return googleUser;
  }
}
