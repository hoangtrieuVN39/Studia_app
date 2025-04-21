import 'package:flutter/material.dart';

class AppPageRouteBuilder extends PageRouteBuilder {
  final Widget page;
  AppPageRouteBuilder({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          );
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.ease,
          );
          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        },
      );
}
