import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studia/core/data/datasources/local/datasource_local.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/features/auth/data/datasources/login_datasource_local.dart';
import 'package:studia/features/auth/data/datasources/login_datasource_remote.dart';
import 'package:studia/features/auth/data/repositories/login_repository_local_impl.dart';
import 'package:studia/features/auth/data/repositories/login_repository_remote_impl.dart';
import 'package:studia/features/auth/domain/usecases/login.dart';
import '../bloc/login_bloc.dart';
import './login_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }
        final sharedPreferences = snapshot.data!;
        return BlocProvider(
          create:
              (context) => LoginBloc(
                loginUsecase: LoginUsecase(
                  loginRepositoryLocal: LoginRepositoryLocalImpl(
                    loginDatasourceLocal: LoginDatasourceLocal(
                      datasourceLocal: DatasourceLocal(
                        sharedPreferences: sharedPreferences,
                      ),
                    ),
                  ),
                  loginRepositoryRemote: LoginRepositoryRemoteImpl(
                    loginDatasourceRemote: LoginDatasourceRemote(
                      datasourceRemote: DatasourceRemote(dio: Dio()),
                    ),
                  ),
                ),
              ),
          child: const LoginContainer(),
        );
      },
    );
  }
}
