import 'package:flutter/material.dart';
import 'package:studia/core/navigation/page_route_builder.dart';
import 'package:studia/core/navigation/route.dart';


class NavigatorService {
  static push(BuildContext context, String routeName, {dynamic data}) {
    Navigator.push(
      context,
      AppPageRouteBuilder(
        page: AppRoutes.getPage(routeName, context, data: data),
      ),
    );
  }

  static pushReplacement(
    BuildContext context,
    String routeName, {
    dynamic data,
  }) {
    Navigator.pushReplacement(
      context,
      AppPageRouteBuilder(
        page: AppRoutes.getPage(routeName, context, data: data),
      ),
    );
  }

  static pushAndRemoveUntil(
    BuildContext context,
    String routeName, {
    dynamic data,
  }) {
    Navigator.pushAndRemoveUntil(
      context,
      AppPageRouteBuilder(
        page: AppRoutes.getPage(routeName, context, data: data),
      ),
      (route) => false,
    );
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
