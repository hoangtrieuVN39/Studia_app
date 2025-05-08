import 'package:flutter/material.dart';
import 'package:studia/core/navigation/page_route_builder.dart';
import 'package:studia/core/navigation/route.dart';

class NavigatorService {
  static push(BuildContext context, String routeName) {
    Navigator.push(
      context,
      AppPageRouteBuilder(page: AppRoutes.getPage(routeName, context)),
    );
  }

  static pushReplacement(BuildContext context, String routeName) {
    Navigator.pushReplacement(
      context,
      AppPageRouteBuilder(page: AppRoutes.getPage(routeName, context)),
    );
  }

  static pushAndRemoveUntil(BuildContext context, String routeName) {
    Navigator.pushAndRemoveUntil(
      context,
      AppPageRouteBuilder(page: AppRoutes.getPage(routeName, context)),
      (route) => false,
    );
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
