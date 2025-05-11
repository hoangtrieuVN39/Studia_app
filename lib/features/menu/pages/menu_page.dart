import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';

import 'package:studia/features/menu/bloc/menu_bloc.dart';
import 'package:studia/features/menu/pages/menu_container.dart';
import 'package:studia/main.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuBloc(getIt<UserProvider>().user!),
      child: MenuContainer(),
    );
  }
}
