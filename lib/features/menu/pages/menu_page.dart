import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart';
import 'package:studia/features/auth/data/datasources/login_datasource_local.dart';
import 'package:studia/features/auth/data/repositories/login_repository_local_impl.dart';
import 'package:studia/features/auth/domain/usecases/logout_usecase.dart';
import 'package:studia/features/menu/bloc/menu_bloc.dart';
import 'package:studia/features/menu/pages/menu_container.dart';
import 'package:studia/main.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => MenuBloc(
            getIt<UserProvider>().user!,
            LogoutUsecase(
              loginRepositoryLocal: LoginRepositoryLocalImpl(
                loginDatasourceLocal: LoginDatasourceLocal(
                  prefs: getIt.get<SharedPrefsManager>(),
                ),
              ),
            ),
          ),
      child: MenuContainer(),
    );
  }
}
