import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/features/settings/data/repositories/settings_repository_local_impl.dart';
import 'package:studia/main.dart';
import 'package:studia/features/settings/domain/usecases/update_language_usecase.dart';
import '../bloc/settings_bloc.dart';
import './settings_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SettingsBloc(
            getIt<LanguageProvider>().language,
            UpdateLanguageUsecase(
              getIt<LanguageProvider>(),
              SettingsRepositoryLocalImpl(getIt<SharedPrefsManager>()),
            ),
          ),
      child: const SettingsContainer(),
    );
  }
}
