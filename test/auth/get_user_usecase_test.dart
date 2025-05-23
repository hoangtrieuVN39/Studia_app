import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_remote.dart';
import 'package:studia/features/auth/domain/usecases/get_user_usecase.dart';

@GenerateNiceMocks([MockSpec<LoginRepositoryRemote>()])
import 'get_user_usecase_test.mocks.dart';

void main() {
  late GetUserUsecase usecase;
  late MockLoginRepositoryRemote mockLoginRepositoryRemote;

  setUp(() {
    mockLoginRepositoryRemote = MockLoginRepositoryRemote();
    usecase = GetUserUsecase(loginRepositoryRemote: mockLoginRepositoryRemote);
  });

  test('should get user from repository', () async {
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

    // act
    final result = await usecase(userId);

    // assert
    verify(mockLoginRepositoryRemote.getUser(userId));
    expect(result, user);
  });

  test('should return null when user not found', () async {
    // arrange
    const userId = 'non_existent_user_id';
    when(
      mockLoginRepositoryRemote.getUser(userId),
    ).thenAnswer((_) async => null);

    // act
    final result = await usecase(userId);

    // assert
    verify(mockLoginRepositoryRemote.getUser(userId));
    expect(result, null);
  });
}
