import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/features/settings/domain/usecases/update_language_usecase.dart';
import 'package:studia/core/constants/language_constants.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/features/settings/domain/repositories/settings_repository_local.dart';

@GenerateNiceMocks([
  MockSpec<LanguageProvider>(),
  MockSpec<SettingsRepositoryLocal>(),
])
import 'update_language_usecase_test.mocks.dart';

void main() {
  late UpdateLanguageUsecase usecase;
  late MockLanguageProvider mockLanguageProvider;
  late MockSettingsRepositoryLocal mockSettingsRepositoryLocal;

  setUp(() {
    mockLanguageProvider = MockLanguageProvider();
    mockSettingsRepositoryLocal = MockSettingsRepositoryLocal();
    usecase = UpdateLanguageUsecase(
      mockLanguageProvider,
      mockSettingsRepositoryLocal,
    );
  });

  test('should update and save language', () async {
    final language = Language.en;
    when(
      mockSettingsRepositoryLocal.saveLanguage(language),
    ).thenAnswer((_) async => null);
    await usecase.call(language);
    verify(mockLanguageProvider.setLanguage(language)).called(1);
    verify(mockSettingsRepositoryLocal.saveLanguage(language)).called(1);
  });
}
