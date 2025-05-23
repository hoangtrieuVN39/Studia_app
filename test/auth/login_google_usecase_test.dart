import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/features/auth/domain/usecases/login_google_usecase.dart';

@GenerateNiceMocks([MockSpec<GoogleSignIn>(), MockSpec<GoogleSignInAccount>()])
import 'login_google_usecase_test.mocks.dart';

void main() {
  late LoginGoogleUsecase usecase;
  late MockGoogleSignIn mockGoogleSignIn;
  late MockGoogleSignInAccount mockGoogleSignInAccount;

  setUp(() {
    mockGoogleSignIn = MockGoogleSignIn();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    usecase = LoginGoogleUsecase(googleSignIn: mockGoogleSignIn);
  });

  test('should sign in with Google successfully', () async {
    // arrange
    when(
      mockGoogleSignIn.signIn(),
    ).thenAnswer((_) async => mockGoogleSignInAccount);

    // act
    final result = await usecase();

    // assert
    verify(mockGoogleSignIn.signIn());
    expect(result, mockGoogleSignInAccount);
  });

  test('should return null when sign in is cancelled', () async {
    // arrange
    when(mockGoogleSignIn.signIn()).thenAnswer((_) async => null);

    // act
    final result = await usecase();

    // assert
    verify(mockGoogleSignIn.signIn());
    expect(result, null);
  });
}
