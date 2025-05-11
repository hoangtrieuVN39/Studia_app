import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/widgets/app_nav_bar.dart';
import 'package:studia/features/home/presentation/pages/home_page.dart';
import 'package:studia/features/main/bloc/main_bloc.dart';
import 'package:studia/features/menu/pages/menu_page.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: switch (mainBloc.state.navBarStatus) {
            0 => HomePage(),
            1 => Scaffold(
              body: Center(child: Text(NavBarStatus.chat.label.toString())),
            ),
            2 => MenuPage(),
            _ => const Scaffold(body: Center(child: Text('Error'))),
          },
          bottomNavigationBar: AppNavBar(
            currentIndex: mainBloc.state.navBarStatus,
            navBarStatus: {
              'Home': {
                'default': NavBarStatus.home.icon_default,
                'select': NavBarStatus.home.icon_selected,
              },
              'Chat': {
                'default': NavBarStatus.chat.icon_default,
                'select': NavBarStatus.chat.icon_selected,
              },
              'Menu': {
                'default': NavBarStatus.menu.icon_default,
                'select': NavBarStatus.menu.icon_selected,
              },
            },
            onTap: (int index) {
              mainBloc.add(MainEvent.navBarStatusChanged(index));
            },
          ),
        );
      },
    );
  }
}
