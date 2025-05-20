import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/auth/domain/usecases/fetch_domains_usecase.dart';
import 'package:studia/features/auth/domain/usecases/fetch_levels_usecase.dart';
import 'package:studia/features/profile/data/datasources/profile_datasource_remote.dart';
import 'package:studia/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:studia/features/profile/domain/usecases/edit_usecase.dart';
import 'package:studia/features/profile/presentation/bloc/edit/profile_edit_bloc.dart';

import 'package:studia/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:studia/features/profile/presentation/pages/profile_container.dart';
import 'package:studia/features/profile/presentation/pages/profile_edit_container.dart';
import 'package:studia/main.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProfileEditBloc(
            FetchLevelsUsecase(getIt<AppDatabase>()),
            FetchDomainsUsecase(getIt<AppDatabase>()),
            EditProfileUsecase(
              getIt<UserProvider>(),
              ProfileRepositoryImpl(
                profileDatasourceRemote: ProfileDatasourceRemote(getIt<Dio>()),
              ),
            ),
            getIt<UserProvider>().user!,
          ),
      child: const ProfileEditContainer(),
    );
  }
}
