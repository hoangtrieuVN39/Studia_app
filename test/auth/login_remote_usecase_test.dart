import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_remote.dart';
import 'package:studia/features/auth/domain/usecases/login_remote_usecase.dart';

@GenerateNiceMocks([
  MockSpec<LoginRepositoryRemote>(),
  MockSpec<LoginRepositoryLocal>(),
])
import 'login_remote_usecase_test.mocks.dart';

void main() {
  late LoginRemoteUsecase usecase;
  late MockLoginRepositoryRemote mockLoginRepositoryRemote;
  late MockLoginRepositoryLocal mockLoginRepositoryLocal;

  setUp(() {
    mockLoginRepositoryRemote = MockLoginRepositoryRemote();
    mockLoginRepositoryLocal = MockLoginRepositoryLocal();
    usecase = LoginRemoteUsecase(
      loginRepositoryRemote: mockLoginRepositoryRemote,
      loginRepositoryLocal: mockLoginRepositoryLocal,
    );
  });

  test('should get user and save to local storage when user exists', () async {
    // arrange
    const userId = 'test_user_id';
    final user = User(
      id: userId,
      firstName: 'Test',
      lastName: 'User',
      gender: 'Male',
      email: 'test@example.com',
      avatar: 'https://example.com/photo.jpg',
      birthYear: 2000,
      performance: [0.0],
    );
    when(
      mockLoginRepositoryRemote.getUser(userId),
    ).thenAnswer((_) async => user);
    when(
      mockLoginRepositoryLocal.saveUser(userId, user.email),
    ).thenAnswer((_) async => {});

    // act
    final result = await usecase(userId);

    // assert
    verify(mockLoginRepositoryRemote.getUser(userId));
    verify(mockLoginRepositoryLocal.saveUser(userId, user.email));
    expect(result, user);
  });

  test('should return null when user does not exist', () async {
    // arrange
    const userId = 'non_existent_user_id';
    when(
      mockLoginRepositoryRemote.getUser(userId),
    ).thenAnswer((_) async => null);

    // act
    final result = await usecase(userId);

    // assert
    verify(mockLoginRepositoryRemote.getUser(userId));
    verifyNever(mockLoginRepositoryLocal.saveUser(any, any));
    expect(result, null);
  });
}
