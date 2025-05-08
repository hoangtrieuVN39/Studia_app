import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/features/main/bloc/main_bloc.dart';
import 'package:studia/features/main/pages/main_container.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MainBloc())],
      child: const MainContainer(),
    );
  }
}
