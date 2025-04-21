import 'package:flutter/material.dart';
import 'package:studia/core/navigation/page_route_builder.dart';
import 'package:studia/core/navigation/route.dart';

class NavigatorService {
  static navigateTo(BuildContext context, String routeName) {
    Navigator.push(
      context,
      AppPageRouteBuilder(page: AppRoutes.getPage(routeName, context)),
    );
  }
}
