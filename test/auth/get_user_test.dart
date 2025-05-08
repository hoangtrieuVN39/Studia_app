import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_remote.dart';
import 'package:studia/features/auth/domain/usecases/get_user_usecase.dart';

@GenerateMocks([LoginRepositoryRemote])
import 'get_user_test.mocks.dart';

void main() {
  late GetUserUsecase getUserUsecase;
  late MockLoginRepositoryRemote mockLoginRepositoryRemote;

  final mockUser = User(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    gender: 'male',
    email: 'john.doe@example.com',
    avatar: 'https://via.placeholder.com/150',
    level: 4,
    birthYear: 1990,
    performance: [
      for (var i = 0; i < 300; i++)
        [for (var j = 0; j < 4; j++) Random().nextDouble()],
    ],
  );

  setUp(() {
    mockLoginRepositoryRemote = MockLoginRepositoryRemote();
    getUserUsecase = GetUserUsecase(
      loginRepositoryRemote: mockLoginRepositoryRemote,
    );
  });

  test('should return a user', () async {
    when(
      mockLoginRepositoryRemote.getUser(any),
    ).thenAnswer((_) async => mockUser);
    final user = await getUserUsecase('1');
    print(user?.performance);
    expect(user, isA<User>());
  });
}
