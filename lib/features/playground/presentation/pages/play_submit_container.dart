import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';
import 'package:studia/features/playground/presentation/bloc/play_bloc.dart';

class PlaySubmitContainer extends StatelessWidget {
  final PlayBloc bloc;
  final PlayState state;

  const PlaySubmitContainer({
    super.key,
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              state.questions[state.currentQuestionIndex].question,
              style: AppTextStyles.h3.copyWith(color: AppColors.darkgray),
            ),
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: _buildSubmitChoices(
            state.questions,
            state.currentQuestionIndex,
            state.selectedChoices[state.currentQuestionIndex],
            state.questions[state.currentQuestionIndex].answer,
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'View Solution',
                onPressed: () {
                  bloc.add(PlayEvent.viewSolution());
                },
                isDisabled:
                    state.selectedChoices[state.currentQuestionIndex] == -1,
                type: AppButtonType.transparent,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: CustomButton(
                text:
                    state.currentQuestionIndex == state.questions.length - 1
                        ? 'Done'
                        : 'Next',
                onPressed: () {
                  if (state.currentQuestionIndex ==
                      state.questions.length - 1) {
                    bloc.add(PlayEvent.done());
                  } else {
                    bloc.add(PlayEvent.nextQuestion());
                  }
                },
                type: AppButtonType.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSubmitChoice(
    Question question,
    int index,
    bool isSelected,
    bool isCorrect,
  ) {
    Color bgColor;
    Color txtColor;
    if (isCorrect) {
      bgColor = AppColors.positiveLight;
      txtColor = AppColors.positiveDark;
    } else {
      if (isSelected) {
        bgColor = AppColors.negativeLight;
        txtColor = AppColors.negativeDark;
      } else {
        bgColor = AppColors.coolgray;
        txtColor = AppColors.darkgray;
      }
    }

    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        height: double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          question.choices[index].choice_text,
          style: AppTextStyles.subheading.copyWith(color: txtColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildSubmitChoices(
    List<Question> questions,
    int index,
    int? selectedChoice,
    int? correctChoice,
  ) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              _buildSubmitChoice(
                questions[index],
                0,
                selectedChoice == 0,
                correctChoice == 0,
              ),
              SizedBox(width: 8),
              _buildSubmitChoice(
                questions[index],
                1,
                selectedChoice == 1,
                correctChoice == 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Expanded(
          child: Row(
            children: [
              _buildSubmitChoice(
                questions[index],
                2,
                selectedChoice == 2,
                correctChoice == 2,
              ),
              SizedBox(width: 8),
              _buildSubmitChoice(
                questions[index],
                3,
                selectedChoice == 3,
                correctChoice == 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
