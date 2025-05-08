import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const CustomIcon({
    super.key,
    this.icon = Icons.arrow_drop_down,
    this.color = AppColors.darkgray,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color, size: size);
  }
}
