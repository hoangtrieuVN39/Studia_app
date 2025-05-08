import 'package:flutter/material.dart';
import 'package:studia/features/auth/presentation/pages/login_page.dart';
import 'package:studia/features/auth/presentation/pages/register_fav_page.dart';
import 'package:studia/features/auth/presentation/pages/register_page.dart';
import 'package:studia/features/home/presentation/pages/home_page.dart';
import 'package:studia/features/main/pages/main_page.dart';
import 'package:studia/features/splash/presentation/pages/splash_page.dart';

class RouteConstants {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String registerFav = '/register-fav';
  static const String home = '/home';
  static const String main = '/main';
}

class AppRoutes {
  static Map<String, WidgetBuilder> routes({dynamic data}) {
    return {
      RouteConstants.splash: (context) => const SplashPage(),
      RouteConstants.login: (context) => const LoginPage(),
      RouteConstants.register: (context) => const RegisterPage(),
      RouteConstants.registerFav: (context) => RegisterFavPage(data: data),
      RouteConstants.home: (context) => const HomePage(),
      RouteConstants.main: (context) => const MainPage(),
      // profile: (context) => const ProfileContainer(),
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

  static const initialRoute = RouteConstants.main;
}
