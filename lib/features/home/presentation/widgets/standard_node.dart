import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum StandardType { progress, completed, disabled, recommended }

extension StandardTypeExtension on StandardType {
  static const String _progressAsset = 'assets/svg/standard/progress.svg';
  static const String _completedAsset = 'assets/svg/standard/done.svg';
  static const String _disabledAsset = 'assets/svg/standard/disabled.svg';
  static const String _recommendedAsset = 'assets/svg/standard/recommend.svg';

  String get asset {
    switch (this) {
      case StandardType.progress:
        return _progressAsset;
      case StandardType.completed:
        return _completedAsset;
      case StandardType.disabled:
        return _disabledAsset;
      case StandardType.recommended:
        return _recommendedAsset;
    }
  }
}

class StandardNode extends StatelessWidget {
  final StandardType type;
  final bool isSelected;
  final void Function() onTap;

  const StandardNode({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        clipBehavior: Clip.none,
        decoration: const BoxDecoration(),
        child: Stack(
          clipBehavior: Clip.none,
          children:
              isSelected
                  ? [
                    Positioned(
                      child: SvgPicture.asset(
                        type.asset,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Positioned(bottom: 10, child: SvgPicture.asset(type.asset)),
                  ]
                  : [SvgPicture.asset(type.asset)],
        ),
      ),
    );
  }
}
