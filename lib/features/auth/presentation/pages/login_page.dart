import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart';
import 'package:studia/core/data/datasources/remote/http_manager.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/core/network/api_client.dart';
import 'package:studia/core/network/network_info.dart';
import 'package:studia/features/auth/data/datasources/login_datasource_local.dart';
import 'package:studia/features/auth/data/datasources/login_datasource_remote.dart';
import 'package:studia/features/auth/data/repositories/login_repository_local_impl.dart';
import 'package:studia/features/auth/data/repositories/login_repository_remote_impl.dart';
import 'package:studia/features/auth/domain/usecases/check_internet_connection_usecase.dart';
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
    final networkInfo = NetworkInfoImpl();

    return BlocProvider(
      create:
          (context) => LoginBloc(
            loginSharedPrefsUsecase: LoginSharedPrefsUsecase(
              loginRepositoryLocal: LoginRepositoryLocalImpl(
                loginDatasourceLocal: LoginDatasourceLocal(
                  prefs: SharedPrefsManager(getIt.get<SharedPreferences>()),
                ),
              ),
            ),
            loginGoogleUsecase: LoginGoogleUsecase(),
            loginRemoteUsecase: LoginRemoteUsecase(
              loginRepositoryRemote: LoginRepositoryRemoteImpl(
                loginDatasourceRemote: LoginDatasourceRemoteImpl(
                  datasourceRemote: ApiClient(dio: getIt.get<Dio>()),
                ),
                appDatabase: getIt.get<AppDatabase>(),
              ),
              loginRepositoryLocal: LoginRepositoryLocalImpl(
                loginDatasourceLocal: LoginDatasourceLocal(
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
