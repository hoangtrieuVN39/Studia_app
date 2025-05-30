import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/data/datasources/remote/dio_service.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/network/api_client.dart';
import 'package:studia/features/auth/domain/usecases/fetch_levels_usecase.dart';
import 'package:studia/features/profile/data/datasources/profile_datasource_remote.dart';
import 'package:studia/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:studia/features/profile/domain/usecases/edit_usecase.dart';
import 'package:studia/features/profile/domain/usecases/fetch_skills_usecase.dart';
import 'package:studia/features/profile/domain/usecases/get_learned_skills_usecase.dart';
import 'package:studia/features/profile/domain/usecases/get_performance_skills_usecase.dart';
import 'package:studia/features/profile/domain/usecases/sort_skills_usecase.dart';

import 'package:studia/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:studia/features/profile/presentation/pages/profile_container.dart';
import 'package:studia/main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProfileBloc(
            getIt<UserProvider>().user!,
            FetchLevelsUsecase(getIt<AppDatabase>()),
            FetchSkillsUsecase(getIt<AppDatabase>()),
            GetLearnedSkillsUsecase(),
            GetPerformanceSkillsUsecase(getIt<AppDatabase>()),
            SortSkillsUsecase(
              ProfileRepositoryImpl(
                profileDatasourceRemote: ProfileDatasourceRemote(
                  ApiClient(getIt<DioService>().dio),
                ),
                appDatabase: getIt<AppDatabase>(),
                userProvider: getIt<UserProvider>(),
              ),
            ),
            EditProfileUsecase(
              getIt<UserProvider>(),
              ProfileRepositoryImpl(
                profileDatasourceRemote: ProfileDatasourceRemote(
                  ApiClient(getIt<DioService>().dio),
                ),
                appDatabase: getIt<AppDatabase>(),
                userProvider: getIt<UserProvider>(),
              ),
            ),
          ),

      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return ProfileContainer();
        },
      ),
    );
  }
}
