import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/features/home/data/datasources/home_datasource_remote.dart';
import 'package:studia/features/home/data/repositories/home_repository_impl.dart';
import 'package:studia/features/home/domain/usecases/fetch_performance_usecase.dart';
import 'package:studia/features/home/domain/usecases/fetch_standards_usecase.dart';
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
                fetchStandardsUsecase: FetchStandardsUsecase(
                  homeRepository: HomeRepositoryImpl(
                    appDatabase: getIt.get<AppDatabaseProvider>().database,
                    remoteDataSource: HomeRemoteDataSource(dio: Dio()),
                  ),
                ),
                fetchPerformanceUsecase: FetchPerformanceUsecase(
                  homeRepository: HomeRepositoryImpl(
                    appDatabase: getIt.get<AppDatabaseProvider>().database,
                    remoteDataSource: HomeRemoteDataSource(dio: Dio()),
                  ),
                ),
              ),
        ),
      ],
      child: const HomeContainer(),
    );
  }
}
