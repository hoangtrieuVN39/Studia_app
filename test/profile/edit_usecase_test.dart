import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/profile/domain/repositories/profile_repository.dart';
import 'package:studia/features/profile/domain/usecases/edit_usecase.dart';

class MockUserProvider extends Mock implements UserProvider {}

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late EditProfileUsecase usecase;
  late MockUserProvider mockUserProvider;
  late MockProfileRepository mockProfileRepository;

  setUp(() {
    mockUserProvider = MockUserProvider();
    mockProfileRepository = MockProfileRepository();
    usecase = EditProfileUsecase(mockUserProvider, mockProfileRepository);
  });

  final testUser = User(
    id: '1',
    email: 'test@test.com',
    firstName: 'Test',
    lastName: 'User',
    gender: 'Male',
    level: Levels(level_id: 1, level_name: 'Test Level'),
    birthYear: 2000,
    performance: [0.8],
    avatar: 'https://example.com/avatar.jpg',
  );

  test('should update user profile', () async {
    // Arrange
    when(() => mockUserProvider.user).thenReturn(testUser);
    when(() => mockUserProvider.setUser(any())).thenAnswer((_) async {});
    when(
      () => mockProfileRepository.updateProfile(any()),
    ).thenAnswer((_) async {});

    // Act
    await usecase.call(
      firstName: 'New Test',
      lastName: 'New User',
      gender: 'Female',
      level: Levels(level_id: 2, level_name: 'New Level'),
      birthYear: 2001,
    );

    // Assert
    verify(() => mockUserProvider.user).called(1);
    verify(() => mockUserProvider.setUser(any())).called(1);
    verify(() => mockProfileRepository.updateProfile(any())).called(1);
  });
}
