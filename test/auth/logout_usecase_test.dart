import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';
import 'package:studia/features/auth/domain/usecases/logout_usecase.dart';

@GenerateNiceMocks([MockSpec<LoginRepositoryLocal>()])
import 'logout_usecase_test.mocks.dart';

void main() {
  late LogoutUsecase usecase;
  late MockLoginRepositoryLocal mockLoginRepositoryLocal;

  setUp(() {
    mockLoginRepositoryLocal = MockLoginRepositoryLocal();
    usecase = LogoutUsecase(loginRepositoryLocal: mockLoginRepositoryLocal);
  });

  test('should remove user from local storage', () async {
    // arrange
    when(mockLoginRepositoryLocal.removeUser()).thenAnswer((_) async => {});

    // act
    await usecase();

    // assert
    verify(mockLoginRepositoryLocal.removeUser());
  });
}
