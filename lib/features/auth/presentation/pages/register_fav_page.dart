import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/core/data/datasources/remote/dio_service.dart';
import 'package:studia/features/auth/data/datasources/login_datasource_local.dart';
import 'package:studia/features/auth/data/datasources/login_datasource_remote.dart';
import 'package:studia/features/auth/data/repositories/login_repository_local_impl.dart';
import 'package:studia/features/auth/data/repositories/login_repository_remote_impl.dart';
import 'package:studia/features/auth/domain/usecases/fetch_domains_usecase.dart';
import 'package:studia/features/auth/domain/usecases/register_usecase.dart';
import '../../../../core/core.dart';
import '../bloc/register_fav/register_fav_bloc.dart';
import './register_fav_container.dart';
import 'package:studia/main.dart';

class RegisterFavPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const RegisterFavPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => RegisterFavBloc(
            FetchDomainsUsecase(getIt.get<AppDatabase>()),
            data,
            RegisterUsecase(
              LoginRepositoryRemoteImpl(
                loginDatasourceRemote: LoginDatasourceRemote(
                  datasourceRemote: DatasourceRemote(dio: getIt.get<Dio>()),
                ),
              ),
              LoginRepositoryLocalImpl(
                loginDatasourceLocal: LoginDatasourceLocal(
                  prefs: SharedPrefsManager(getIt.get<SharedPreferences>()),
                ),
              ),
            )
          ),
      child: RegisterFavContainer(),
    );
  }
}
