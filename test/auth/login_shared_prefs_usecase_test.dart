import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';
import 'package:studia/features/auth/domain/usecases/login_shared-prefs_usecase.dart';

@GenerateNiceMocks([MockSpec<LoginRepositoryLocal>()])
import 'login_shared_prefs_usecase_test.mocks.dart';

void main() {
  late LoginSharedPrefsUsecase usecase;
  late MockLoginRepositoryLocal mockLoginRepositoryLocal;

  setUp(() {
    mockLoginRepositoryLocal = MockLoginRepositoryLocal();
    usecase = LoginSharedPrefsUsecase(
      loginRepositoryLocal: mockLoginRepositoryLocal,
    );
  });

  test(
    'should return user data when user exists in shared preferences',
    () async {
      // arrange
      final userData = {'id': 'test_id', 'email': 'test@example.com'};
      when(
        mockLoginRepositoryLocal.getUser(),
      ).thenAnswer((_) async => userData);

      // act
      final result = await usecase();

      // assert
      verify(mockLoginRepositoryLocal.getUser());
      expect(result, userData);
    },
  );

  test(
    'should return null when user does not exist in shared preferences',
    () async {
      // arrange
      final userData = {'email': 'test@example.com'}; // missing id
      when(
        mockLoginRepositoryLocal.getUser(),
      ).thenAnswer((_) async => userData);

      // act
      final result = await usecase();

      // assert
      verify(mockLoginRepositoryLocal.getUser());
      expect(result, null);
    },
  );

  test('should return null when shared preferences are empty', () async {
    // arrange
    when(mockLoginRepositoryLocal.getUser()).thenAnswer((_) async => {});

    // act
    final result = await usecase();

    // assert
    verify(mockLoginRepositoryLocal.getUser());
    expect(result, null);
  });
}
