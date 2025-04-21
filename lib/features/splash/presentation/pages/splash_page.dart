import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/splash_bloc.dart';
import './splash_container.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              SplashBloc(), // Assuming SplashBloc has a default constructor
      child: const SplashContainer(),
    );
  }
}
