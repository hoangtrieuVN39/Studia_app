import 'package:flutter/material.dart';
import 'package:studia/features/auth/presentation/pages/login_page.dart';
import 'package:studia/features/auth/presentation/pages/register_page.dart';
import 'package:studia/features/home/presentation/pages/home_page.dart';
import 'package:studia/features/information/presentation/pages/info_page.dart';
import 'package:studia/features/main/pages/main_page.dart';
import 'package:studia/features/playground/presentation/pages/play_page.dart';
import 'package:studia/features/profile/presentation/pages/profile_edit_page.dart';
import 'package:studia/features/profile/presentation/pages/profile_page.dart';
import 'package:studia/features/skills/presentation/pages/skills_page.dart';
import 'package:studia/features/splash/presentation/pages/splash_page.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String registerFav = '/register-fav';
  static const String home = '/home';
  static const String main = '/main';
  static const String play = '$home/play';
  static const String profile = '$home/profile';
  static const String profileEdit = '$home/profile/edit';
  static const String skills = '$home/skills';
  static const String info = '$home/info';

  static Map<String, WidgetBuilder> routes({dynamic data}) {
    return {
      splash: (context) => const SplashPage(),
      login: (context) => const LoginPage(),
      register: (context) => RegisterPage(id: data['id'], email: data['email']),
      home: (context) => const HomePage(),
      main: (context) => const MainPage(),
      play: (context) => PlayPage(data: data),
      profile: (context) => const ProfilePage(),
      profileEdit: (context) => const ProfileEditPage(),
      skills: (context) => const SkillsPage(),
      info: (context) => InfoPage(data: data),
      // settings: (context) => const SettingsContainer(),
    };
  }

  static Widget getPage(
    String routeName,
    BuildContext context, {
    dynamic data,
  }) {
    return routes(data: data)[routeName]!(context);
  }

  static const initialRoute = splash;
}
