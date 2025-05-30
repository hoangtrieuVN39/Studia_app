import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/data/datasources/remote/dio_service.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/core/network/api_client.dart';
import 'package:studia/features/home/data/datasources/home_datasource_local.dart';
import 'package:studia/features/home/data/datasources/home_datasource_remote.dart';
import 'package:studia/features/home/data/repositories/home_repository_impl.dart';
import 'package:studia/features/home/domain/usecases/fetch_questions_usecase.dart';
import 'package:studia/features/home/domain/usecases/fetch_recommend_actions_usecase.dart';
import 'package:studia/features/home/domain/usecases/fetch_standards_usecase.dart';
import 'package:studia/features/home/domain/usecases/fetch_valid_actions_usecase.dart';
import 'package:studia/features/home/presentation/bloc/home_bloc.dart';
import 'package:studia/features/home/presentation/pages/home_container.dart';
import 'package:studia/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => HomeBloc(
                fetchValidActionsUsecase: FetchValidActionsUsecase(
                  repository: HomeRepositoryImpl(
                    localDataSource: HomeDatasourceLocal(
                      appDatabase: getIt.get<AppDatabase>(),
                    ),
                    remoteDataSource: HomeDatasourceRemote(
                      datasourceRemote: ApiClient(
                        getIt.get<DioService>().dio,
                      ),
                    ),
                  ),
                ),
                fetchRecommendActionsUsecase: FetchRecommendActionsUsecase(
                  repository: HomeRepositoryImpl(
                    localDataSource: HomeDatasourceLocal(
                      appDatabase: getIt.get<AppDatabase>(),
                    ),
                    remoteDataSource: HomeDatasourceRemote(
                      datasourceRemote: ApiClient(
                        getIt.get<DioService>().dio,
                      ),
                    ),
                  ),
                ),
                fetchQuestionsUsecase: FetchQuestionsUsecase(
                  homeRepository: HomeRepositoryImpl(
                    remoteDataSource: HomeDatasourceRemote(
                      datasourceRemote: ApiClient(
                        getIt.get<DioService>().dio,
                      ),
                    ),
                    localDataSource: HomeDatasourceLocal(
                      appDatabase: getIt.get<AppDatabase>(),
                    ),
                  ),
                ),
                user: getIt<UserProvider>().user!,
                fetchStandardsUsecase: FetchStandardsUsecase(
                  homeRepository: HomeRepositoryImpl(
                    localDataSource: HomeDatasourceLocal(
                      appDatabase: getIt.get<AppDatabase>(),
                    ),
                    remoteDataSource: HomeDatasourceRemote(
                      datasourceRemote: ApiClient(
                        getIt.get<DioService>().dio,
                      ),
                    ),
                  ),
                ),
              ),
        ),
      ],
      child: const HomeContainer(),
    );
  }
}
