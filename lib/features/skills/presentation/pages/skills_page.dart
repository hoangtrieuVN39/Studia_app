import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/skills/domain/usecases/fetch_domains_usecase.dart';
import 'package:studia/features/skills/domain/usecases/fetch_levels_usecase.dart';
import 'package:studia/features/skills/domain/usecases/fetch_skills_usecase.dart';
import 'package:studia/features/skills/presentation/bloc/skills_bloc.dart';
import 'package:studia/features/skills/presentation/pages/skills_container.dart';
import 'package:studia/main.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SkillsBloc(
            user: getIt<UserProvider>().user!,
            fetchLevelsUsecase: FetchLevelsUsecase(getIt<AppDatabase>()),
            fetchDomainsUsecase: FetchDomainsUsecase(getIt<AppDatabase>()),
            fetchSkillsUsecase: FetchSkillsUsecase(getIt<AppDatabase>()),
          ),
      child: const SkillsContainer(),
    );
  }
}
