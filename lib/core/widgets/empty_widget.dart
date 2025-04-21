import 'package:flutter/material.dart';
import 'package:studia/core/theme/app_colors.dart';
import 'package:studia/core/theme/app_text_styles.dart';

class EmptyWidget extends StatelessWidget {
  final String message;
  final String? actionText;
  final VoidCallback? onAction;
  final IconData icon;

  const EmptyWidget({
    Key? key,
    required this.message,
    this.actionText,
    this.onAction,
    this.icon = Icons.inbox_outlined,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.textSecondary, size: 64),
            const SizedBox(height: 16),
            Text(
              message,
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),
            if (actionText != null && onAction != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onAction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.powerorange,
                  foregroundColor: AppColors.textOnPrimary,
                ),
                child: Text(actionText!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Convenience method for creating common empty states
class EmptyStateFactory {
  static EmptyWidget noItems({
    required String itemName,
    String? actionText,
    VoidCallback? onAction,
  }) {
    return EmptyWidget(
      message: 'No $itemName found',
      actionText: actionText,
      onAction: onAction,
      icon: Icons.list,
    );
  }

  static EmptyWidget noSearchResults({
    String? actionText,
    VoidCallback? onAction,
  }) {
    return EmptyWidget(
      message: 'No search results found',
      actionText: actionText,
      onAction: onAction,
      icon: Icons.search_off,
    );
  }

  static EmptyWidget noFavorites({String? actionText, VoidCallback? onAction}) {
    return EmptyWidget(
      message: 'You don\'t have any favorites yet',
      actionText: actionText,
      onAction: onAction,
      icon: Icons.favorite_border,
    );
  }
}
