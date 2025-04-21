import 'package:flutter/material.dart';
import 'package:studia/core/theme/app_colors.dart';
import 'package:studia/core/theme/app_text_styles.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;
  final bool overlay;

  const LoadingWidget({Key? key, this.message, this.overlay = false})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadingWidget = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.powerorange),
          ),
          if (message != null)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                message!,
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );

    if (overlay) {
      return Stack(
        children: [
          const Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
          loadingWidget,
        ],
      );
    }

    return loadingWidget;
  }
}

// Utility method to show a loading overlay on any screen
Future<T> showLoadingOverlay<T>({
  required BuildContext context,
  required Future<T> future,
  String? message,
}) async {
  final overlayEntry = OverlayEntry(
    builder: (context) => LoadingWidget(message: message, overlay: true),
  );

  Overlay.of(context).insert(overlayEntry);

  try {
    final result = await future;
    overlayEntry.remove();
    return result;
  } catch (e) {
    overlayEntry.remove();
    rethrow;
  }
}
