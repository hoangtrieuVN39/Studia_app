import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/playground/presentation/bloc/play_bloc.dart';

class PlayDoneContainer extends StatelessWidget {
  final PlayState state;
  final BuildContext context;

  const PlayDoneContainer({
    super.key,
    required this.state,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    int correctAnswers = 0;
    for (var i = 0; i < state.questions.length; i++) {
      if (state.selectedChoices[i] == state.questions[i].answer) {
        correctAnswers++;
      }
    }

    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: AppColors.positiveLight,
                    shape: BoxShape.circle,
                  ),
                  child: CustomIcon(
                    icon: Icons.check_circle,
                    color: AppColors.positive,
                    size: 64,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Correct ${correctAnswers} out of ${state.questions.length}!',
                  style: AppTextStyles.h3.copyWith(color: AppColors.darkgray),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        CustomButton(
          text: 'View Solution',
          onPressed: () {
            context.read<PlayBloc>().add(PlayEvent.viewResults());
          },
          isDisabled: state.selectedChoices[state.currentQuestionIndex] == -1,
          type: AppButtonType.transparent,
        ),
        SizedBox(height: 8),
        CustomButton(
          text: "Play Again",
          onPressed: () {},
          type: AppButtonType.primary,
        ),
      ],
    );
  }
}
