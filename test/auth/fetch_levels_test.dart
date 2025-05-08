import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/auth/domain/usecases/fetch_levels_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([AppDatabase])
import 'fetch_levels_test.mocks.dart';

void main() {
  test('fetch levels', () async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDatabase = MockAppDatabase();
    final mockLevels = [
      Levels(level_id: 1, level_name: 'Level 1'),
      Levels(level_id: 2, level_name: 'Level 2'),
    ];
    when(appDatabase.selectLevels()).thenAnswer((_) async => mockLevels);
    final levels = await FetchLevelsUsecase(appDatabase).call();
    expect(levels, equals(mockLevels));
  });
}
