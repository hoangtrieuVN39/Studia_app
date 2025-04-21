import 'package:flutter/material.dart';
import 'package:studia/features/auth/presentation/pages/login_page.dart';
import 'package:studia/features/splash/presentation/pages/splash_page.dart';

class RouteConstants {
  static const String splash = '/splash';
  static const String login = '/login';
}

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    RouteConstants.splash: (context) => const SplashPage(),
    RouteConstants.login: (context) => const LoginPage(),
    // home: (context) => const HomeContainer(),
    // profile: (context) => const ProfileContainer(),
    // settings: (context) => const SettingsContainer(),
  };

  static Widget getPage(String routeName, BuildContext context) {
    return routes[routeName]!(context);
  }

  static const initialRoute = RouteConstants.splash;
}
