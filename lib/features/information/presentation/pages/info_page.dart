import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/information/domain/usecases/fetch_domain_details.dart';
import 'package:studia/features/information/domain/usecases/fetch_level_details.dart';
import 'package:studia/features/information/domain/usecases/fetch_skill_details.dart';
import 'package:studia/features/information/domain/usecases/fetch_standard_details.dart';
import 'package:studia/features/information/presentation/bloc/info_bloc.dart';
import 'package:studia/features/information/presentation/pages/info_container.dart';

import '../../../../main.dart';

class InfoPage extends StatelessWidget {
  final dynamic data;

  const InfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => InfoBloc(
            fetchDomainDetails: FetchDomainDetails(
              database: getIt<AppDatabase>(),
            ),
            fetchLevelDetails: FetchLevelDetails(
              database: getIt<AppDatabase>(),
            ),
            fetchSkillDetails: FetchSkillDetails(
              database: getIt<AppDatabase>(),
            ),
            fetchStandardDetails: FetchStandardDetails(
              database: getIt<AppDatabase>(),
            ),
            user: getIt<UserProvider>().user!,
            data: data,
          ),
      child: InfoContainer(),
    );
  }
}
