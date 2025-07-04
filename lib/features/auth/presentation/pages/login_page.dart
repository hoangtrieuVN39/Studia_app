import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart';
import 'package:studia/core/data/datasources/remote/dio_service.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/core/network/api_client.dart';
import 'package:studia/features/auth/data/datasources/login_datasource_local.dart';
import 'package:studia/features/auth/data/datasources/login_datasource_remote.dart';
import 'package:studia/features/auth/data/repositories/login_repository_local_impl.dart';
import 'package:studia/features/auth/data/repositories/login_repository_remote_impl.dart';
import 'package:studia/features/auth/domain/usecases/get_language_usecase.dart';
import 'package:studia/features/auth/domain/usecases/login_google_usecase.dart';
import 'package:studia/features/auth/domain/usecases/login_remote_usecase.dart';
import 'package:studia/features/auth/domain/usecases/login_shared-prefs_usecase.dart';
import '../bloc/login/login_bloc.dart';
import './login_container.dart';
import 'package:studia/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginBloc(
            loginSharedPrefsUsecase: LoginSharedPrefsUsecase(
              loginRepositoryLocal: LoginRepositoryLocalImpl(
                LoginDatasourceLocal(
                  prefs: SharedPrefsManager(getIt.get<SharedPreferences>()),
                ),
              ),
            ),
            getLanguageUsecase: GetLanguageUsecase(
              LoginRepositoryLocalImpl(
                LoginDatasourceLocal(
                  prefs: SharedPrefsManager(getIt.get<SharedPreferences>()),
                ),
              ),
              getIt.get<LanguageProvider>(),
            ),
            loginGoogleUsecase: LoginGoogleUsecase(),
            loginRemoteUsecase: LoginRemoteUsecase(
              loginRepositoryRemote: LoginRepositoryRemoteImpl(
                loginDatasourceRemote: LoginDatasourceRemoteImpl(
                  datasourceRemote: ApiClient(getIt.get<DioService>().dio),
                ),
                appDatabase: getIt.get<AppDatabase>(),
              ),
              loginRepositoryLocal: LoginRepositoryLocalImpl(
                LoginDatasourceLocal(
                  prefs: SharedPrefsManager(getIt.get<SharedPreferences>()),
                ),
              ),
            ),
            userProvider: getIt.get<UserProvider>(),
          ),
      child: const LoginContainer(),
    );
  }
}
