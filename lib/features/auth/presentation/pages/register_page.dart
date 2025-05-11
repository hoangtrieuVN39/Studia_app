import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart';
import 'package:studia/features/auth/data/datasources/login_datasource_local.dart';
import 'package:studia/features/auth/data/repositories/login_repository_local_impl.dart';
import 'package:studia/features/auth/domain/usecases/fetch_levels_usecase.dart';
import 'package:studia/features/auth/domain/usecases/logout_usecase.dart';
import '../../../../core/core.dart';
import '../bloc/register/register_bloc.dart';
import './register_container.dart';
import 'package:studia/main.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => RegisterBloc(
            FetchLevelsUsecase(getIt.get<AppDatabase>()),
            LogoutUsecase(
              getIt.get<AppDatabase>(),
              loginRepositoryLocal: LoginRepositoryLocalImpl(
                loginDatasourceLocal: LoginDatasourceLocal(
                  prefs: SharedPrefsManager(getIt.get<SharedPreferences>()),
                ),
              ),
            ),
          ),
      child: RegisterContainer(),
    );
  }
}
