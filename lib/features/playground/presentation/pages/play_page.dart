import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:studia/features/playground/presentation/bloc/play_bloc.dart';
import 'package:studia/features/playground/presentation/pages/play_container.dart';

import '../../../../main.dart';

class PlayPage extends StatelessWidget {
  final dynamic data;

  const PlayPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayBloc(data['questions'], data['isFirstPlay']),
      child: const PlayContainer(),
    );
  }
}
