import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart';
import 'package:studia/core/data/datasources/remote/http_manager.dart';
import 'package:studia/core/network/api_client.dart';
import 'package:studia/features/auth/data/datasources/login_datasource_local.dart';
import 'package:studia/features/auth/data/datasources/login_datasource_remote.dart';
import 'package:studia/features/auth/data/repositories/login_repository_local_impl.dart';
import 'package:studia/features/auth/data/repositories/login_repository_remote_impl.dart';
import 'package:studia/features/auth/domain/usecases/fetch_domains_usecase.dart';
import 'package:studia/features/auth/domain/usecases/fetch_levels_usecase.dart';
import 'package:studia/features/auth/domain/usecases/logout_usecase.dart';
import 'package:studia/features/auth/domain/usecases/register_usecase.dart';
import '../bloc/register/register_bloc.dart';
import './register_container.dart';
import 'package:studia/main.dart';

class RegisterPage extends StatelessWidget {
  final id;
  final email;
  const RegisterPage({super.key, required this.id, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => RegisterBloc(
            id,
            email,
            FetchLevelsUsecase(getIt.get<AppDatabase>()),
            LogoutUsecase(
              loginRepositoryLocal: LoginRepositoryLocalImpl(
                loginDatasourceLocal: LoginDatasourceLocal(
                  prefs: SharedPrefsManager(getIt.get<SharedPreferences>()),
                ),
              ),
            ),
            FetchDomainsUsecase(getIt.get<AppDatabase>()),
            RegisterUsecase(
              LoginRepositoryRemoteImpl(
                loginDatasourceRemote: LoginDatasourceRemoteImpl(
                  datasourceRemote: HttpManager(client: http.Client()),
                ),
                appDatabase: getIt.get<AppDatabase>(),
              ),
              LoginRepositoryLocalImpl(
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
