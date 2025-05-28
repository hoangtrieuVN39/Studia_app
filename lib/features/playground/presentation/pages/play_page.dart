import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/data/datasources/remote/dio_service.dart';
import 'package:studia/core/network.dart';
import 'package:studia/features/playground/data/datasources/play_datasource_remote.dart';
import 'package:studia/features/playground/data/repositories/play_repository_impl.dart';
import 'package:studia/features/playground/domain/repositories/play_repository.dart';
import 'package:studia/features/playground/domain/usecases/send_answer_usecase.dart';

import 'package:studia/features/playground/presentation/bloc/play_bloc.dart';
import 'package:studia/features/playground/presentation/pages/play_container.dart';

import '../../../../main.dart';

class PlayPage extends StatelessWidget {
  final dynamic data;

  const PlayPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => PlayBloc(
            data['questions'],
            data['isFirstPlay'],
            SendAnswersUsecase(
              playRepository: PlayRepositoryImpl(
                playDatasourceRemote: PlayDatasourceRemote(
                  datasourceRemote: ApiClient(dio: getIt<DioService>().dio),
                ),
              ),
            ),
          ),
      child: const PlayContainer(),
    );
  }
}
