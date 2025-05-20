import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';

class AppBottomNavBar extends StatelessWidget {
  final Map<String, Map<String, IconData>> navBarStatus;
  final Function(int) onTap;
  final int currentIndex;
  const AppBottomNavBar({
    required this.navBarStatus,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 32),
      color: AppColors.snow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: List<Widget>.generate(
          navBarStatus.entries.length,
          (index) => _buildItem(
            navBarStatus.entries.toList()[index].key,
            navBarStatus.entries.toList()[index].value,
            index == currentIndex,
            () => onTap(index),
          ),
        ),
      ),
    );
  }

  _buildItem(
    String label,
    Map<String, IconData> icon,
    bool isSelected,
    Function() onTap,
  ) {
    return Expanded(
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: AppColors.snow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide.none,
          ),
          maximumSize: const Size(double.infinity, 48),
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 3,
                color: isSelected ? AppColors.orange : AppColors.snow,
              ),
            ),
            Center(
              child: Icon(
                isSelected ? icon['select'] : icon['default'],
                size: 24,
                color: isSelected ? AppColors.orange : AppColors.darkgray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppNavBar extends StatelessWidget {
  final List<String> navBarStatus;
  final Function(int) onTap;
  final int currentIndex;
  const AppNavBar({
    required this.navBarStatus,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.snow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: List<Widget>.generate(
          navBarStatus.length,
          (index) => _buildItem(
            navBarStatus[index],
            index == currentIndex,
            () => onTap(index),
          ),
        ),
      ),
    );
  }

  _buildItem(String label, bool isSelected, Function() onTap) {
    return Expanded(
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: AppColors.snow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide.none,
          ),
          maximumSize: const Size(double.infinity, 48),
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 3,
                color: isSelected ? AppColors.orange : AppColors.snow,
              ),
            ),
            Center(
              child: Text(
                label,
                style: AppTextStyles.subheading.copyWith(
                  color: isSelected ? AppColors.orange : AppColors.darkgray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
