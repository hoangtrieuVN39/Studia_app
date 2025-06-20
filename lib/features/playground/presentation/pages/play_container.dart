import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/home/presentation/pages/home_page.dart';
import 'package:studia/features/playground/presentation/bloc/play_bloc.dart';
import 'package:studia/features/playground/presentation/pages/play_choice_container.dart';
import 'package:studia/features/playground/presentation/pages/play_done_container.dart';
import 'package:studia/features/playground/presentation/pages/play_results_container.dart';
import 'package:studia/features/playground/presentation/pages/play_submit_container.dart';
import 'package:studia/main.dart';

class PlayContainer extends StatelessWidget {
  const PlayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayBloc, PlayState>(
      listener: (context, state) {
        if (state.isViewingSolution) {
          CustomDialog.show(
            context,
            icon: Icons.notes,
            title: getIt.get<AppTextConstants>().solution,
            description: state.questions[state.currentQuestionIndex].solution,
          );
        }
        if (state.isQuit) {
          CustomDialog.show(
            context,
            icon: Icons.warning_outlined,
            title: getIt.get<AppTextConstants>().quitWarning,
            buttons: [
              CustomButton(
                text: getIt.get<AppTextConstants>().quit,
                onPressed:
                    () =>
                        context.read<PlayBloc>().add(PlayEvent.quitConfirmed()),
                type: AppButtonType.transparent,
              ),
              CustomButton(
                text: getIt.get<AppTextConstants>().stay,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        }
        if (state.isQuitConfirmed) {
          NavigatorService.pushReplacement(context, AppRoutes.main);
        }
      },
      builder: (context, state) {
        if (state.isLoading ||
            state.questions.isEmpty ||
            state.selectedChoices.isEmpty) {
          return const LoadingWidget();
        }

        Widget container;
        if (state.isViewingResults) {
          container = PlayResultsContainer(
            bloc: context.read<PlayBloc>(),
            state: state,
          );
        } else if (state.isSubmit) {
          container = PlaySubmitContainer(
            bloc: context.read<PlayBloc>(),
            state: state,
          );
        } else if (state.isDone) {
          container = PlayDoneContainer(
            bloc: context.read<PlayBloc>(),
            state: state,
          );
        } else {
          container = PlayChoiceContainer(
            bloc: context.read<PlayBloc>(),
            state: state,
          );
        }

        return Scaffold(
          appBar: CustomAppBar.build(
            context,
            Container(
              width: MediaQuery.of(context).size.width,
              child: CustomProgress(
                progress:
                    (state.currentQuestionIndex + 1) / state.questions.length,
                size: ProgressBarSize.regular,
              ),
            ),
            actions: CustomFractionChip(
              numerator: state.currentQuestionIndex + 1,
              denominator: state.questions.length,
            ),
            leading:
                !state.isFirstPlay
                    ? CustomButton(
                      leading: Icon(
                        Icons.arrow_back,
                        color: AppColors.darkgray,
                      ),
                      onPressed:
                          () => context.read<PlayBloc>().add(PlayEvent.quit()),
                      type: AppButtonType.transparent,
                    )
                    : null,
          ),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: container,
            ),
          ),
        );
      },
    );
  }
}
