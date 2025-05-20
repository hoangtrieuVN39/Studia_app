import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/theme/app_text_styles.dart';
import 'package:studia/core/widgets/app_bar.dart';
import 'package:studia/features/menu/bloc/menu_bloc.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuBloc, MenuState>(
      listener: (context, state) {
        if (state.isViewProfile) {
          NavigatorService.pushReplacement(context, AppRoutes.profile);
        }
        if (state.isViewSkills) {
          NavigatorService.push(context, AppRoutes.skills);
        }
        if (state.isLogout) {
          NavigatorService.pushReplacement(context, AppRoutes.login);
        }
      },
      builder: (context, state) {
        final menuBloc = context.read<MenuBloc>();
        return Scaffold(
          appBar: CustomAppBarTitle.build(context, 'Menu'),
          body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child:
                          state.avatar.isNotEmpty
                              ? Image.network(
                                state.avatar,
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                              )
                              : CustomIcon(
                                icon: Icons.account_circle_rounded,
                                size: 64,
                                color: AppColors.gray,
                              ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      state.name,
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.darkgray,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Column(
                    children: [
                      _MenuItem(
                        'Profile',
                        MenuItemColor.gray,
                        Icons.person_outline_rounded,
                        () {
                          menuBloc.add(ViewProfile());
                        },
                      ),
                      SizedBox(height: 8),
                      _MenuItem(
                        'Skills',
                        MenuItemColor.gray,
                        Icons.extension_outlined,
                        () {
                          menuBloc.add(ViewSkills());
                        },
                      ),
                      SizedBox(height: 8),
                      _MenuItem(
                        'Settings',
                        MenuItemColor.gray,
                        Icons.settings_outlined,
                        () {
                          menuBloc.add(ViewSettings());
                        },
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: 16),
                _MenuItem(
                  'Logout',
                  MenuItemColor.red,
                  Icons.logout_outlined,
                  () => menuBloc.add(MenuEvent.logout()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _MenuItem(
    String title,
    MenuItemColor type,
    IconData icon,
    void Function() onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                type == MenuItemColor.gray
                    ? AppColors.coolgray
                    : AppColors.negative,
          ),
        ),
        child: Row(
          children: [
            CustomIcon(
              icon: icon,
              size: 24,
              color:
                  type == MenuItemColor.gray
                      ? AppColors.darkgray
                      : AppColors.negative,
            ),
            SizedBox(width: 12),
            Text(
              title,
              style: AppTextStyles.body.copyWith(
                color:
                    type == MenuItemColor.gray
                        ? AppColors.darkgray
                        : AppColors.negative,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum MenuItemColor { gray, red }
