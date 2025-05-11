import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';
import 'package:studia/features/playground/presentation/bloc/play_bloc.dart';
import 'package:studia/features/playground/presentation/pages/play_container.dart';

class PlayPage extends StatelessWidget {
  final List<Question> questions;

  const PlayPage({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayBloc(questions),
      child: const PlayContainer(),
    );
  }
}
