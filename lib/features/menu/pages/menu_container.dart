import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/widgets/app_bar.dart';
import 'package:studia/features/menu/bloc/menu_bloc.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuBloc, MenuState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBarTitle.build(context, 'Menu'),
          body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(children: [Image.network(state.avatar), Text(state.name)]),
                SizedBox(height: 16),
                Image.asset('assets/images/menu/skills.png'),
                Text('Skills'),
                SizedBox(height: 16),
                Image.asset('assets/images/menu/settings.png'),
                Text('Settings'),
              ],
            ),
          ),
        );
      },
    );
  }
}
