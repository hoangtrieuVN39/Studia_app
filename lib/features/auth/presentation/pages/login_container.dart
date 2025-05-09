import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studia/core/widgets/app_button.dart';
import 'package:studia/features/auth/presentation/pages/register_page.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/login/login_bloc.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.loginResult != null && state.loginResult!['newUser']) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterPage()),
          );
        } else {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const HomePage()),
          // );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.snow,
                  AppColors.orange,
                  AppColors.powerorange,
                ],
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.25,
                    child: SvgPicture.asset(
                      'assets/images/studia_logo.svg',
                      width: 50,
                      height: MediaQuery.of(context).size.height * 0.8,
                      colorFilter: const ColorFilter.mode(
                        AppColors.snow,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),

                      Container(
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.lightorange.withOpacity(0.0),
                              AppColors.powerorange,
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to',
                              style: AppTextStyles.h2.copyWith(
                                color: AppColors.snow,
                              ),
                            ),

                            Text(
                              'Studia',
                              style: AppTextStyles.h1.copyWith(
                                color: AppColors.snow,
                              ),
                            ),
                            const SizedBox(height: 8),

                            Text(
                              'Please login to continue!',
                              style: AppTextStyles.h3.copyWith(
                                color: const Color(0xFFFFCDA9),
                              ),
                            ),

                            const SizedBox(height: 24),

                            CustomButton(
                              text: 'Continue with Google',
                              onPressed: () {
                                loginBloc.add(
                                  const LoginEvent.loginRequested(),
                                );
                              },
                              color: AppButtonColor.gray,
                              type: AppButtonType.secondary,
                              size: AppButtonSize.regular,
                              leading: Image.asset(
                                'assets/images/google_logo.png',
                                width: 24,
                                height: 24,
                              ),
                              width: AppButtonWidth.fill,
                            ),
                          ],
                        ),
                      ),
                    ],
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
