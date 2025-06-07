import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/playground/domain/usecases/update_user_performance_usecase.dart';
import 'package:studia/core/core.dart';

class MockUserProvider extends Mock implements UserProvider {}

class MockUser extends Mock implements User {}

class FakeUser extends Fake implements User {}

void main() {
  late UpdateUserPerformanceUseCase usecase;
  late MockUserProvider mockUserProvider;
  late MockUser mockUser;

  setUpAll(() {
    registerFallbackValue(FakeUser());
  });

  setUp(() {
    mockUserProvider = MockUserProvider();
    mockUser = MockUser();
    when(() => mockUserProvider.user).thenReturn(mockUser);
    when(
      () => mockUser.copyWith(performance: any(named: 'performance')),
    ).thenReturn(mockUser);
    usecase = UpdateUserPerformanceUseCase(userProvider: mockUserProvider);
  });

  test('should update user performance', () async {
    final performance = [1.0, 2.0, 3.0];
    await usecase.call(performance);
    verify(() => mockUserProvider.setUser(mockUser)).called(1);
    verify(() => mockUser.copyWith(performance: performance)).called(1);
  });
}
