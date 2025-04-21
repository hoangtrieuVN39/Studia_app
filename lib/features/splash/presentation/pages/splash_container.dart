import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../bloc/splash_bloc.dart';
import 'package:studia/core/core.dart';

class SplashContainer extends StatelessWidget {
  const SplashContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.done) {
          NavigatorService.navigateTo(context, RouteConstants.login);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.snow,
                  AppColors.lightorange,
                  AppColors.powerorange,
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/studia_logo.svg',
                    width: 100,
                    height: 100,
                    colorFilter: const ColorFilter.mode(
                      AppColors.snow,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Studia',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h1.copyWith(
                      fontSize: 36,
                      color: AppColors.snow,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
