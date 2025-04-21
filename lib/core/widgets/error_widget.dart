import 'package:flutter/material.dart';
import 'package:studia/core/theme/app_colors.dart';
import 'package:studia/core/theme/app_text_styles.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final String retryText;
  final IconData icon;

  const ErrorDisplayWidget({
    Key? key,
    required this.message,
    this.onRetry,
    this.retryText = 'Retry',
    this.icon = Icons.error_outline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.error, size: 64),
            const SizedBox(height: 16),
            Text(
              message,
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.powerorange,
                  foregroundColor: AppColors.textOnPrimary,
                ),
                child: Text(retryText),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class NetworkErrorWidget extends ErrorDisplayWidget {
  NetworkErrorWidget({Key? key, VoidCallback? onRetry})
    : super(
        key: key,
        message:
            'No internet connection. Please check your network settings and try again.',
        onRetry: onRetry,
        icon: Icons.wifi_off,
      );
}

class ServerErrorWidget extends ErrorDisplayWidget {
  ServerErrorWidget({Key? key, VoidCallback? onRetry})
    : super(
        key: key,
        message: 'Server error. Please try again later.',
        onRetry: onRetry,
        icon: Icons.cloud_off,
      );
}

class NotFoundWidget extends ErrorDisplayWidget {
  NotFoundWidget({Key? key, VoidCallback? onRetry})
    : super(
        key: key,
        message: 'The requested resource was not found.',
        onRetry: onRetry,
        icon: Icons.search_off,
      );
}
