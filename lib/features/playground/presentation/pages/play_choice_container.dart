import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';
import 'package:studia/features/playground/presentation/bloc/play_bloc.dart';

class PlayChoiceContainer extends StatelessWidget {
  final PlayState state;
  final BuildContext context;

  const PlayChoiceContainer({
    super.key,
    required this.state,
    required this.context,
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
          child: _buildChoices(
            state.questions,
            state.currentQuestionIndex,
            state.selectedChoices[state.currentQuestionIndex],
            (index) {
              context.read<PlayBloc>().add(PlayEvent.selectChoice(index));
            },
          ),
        ),
        SizedBox(height: 16),
        CustomButton(
          text: 'Submit',
          onPressed: () {
            context.read<PlayBloc>().add(PlayEvent.submit());
          },
          isDisabled: state.selectedChoices[state.currentQuestionIndex] == -1,
          type: AppButtonType.primary,
        ),
      ],
    );
  }

  Widget _buildChoice(
    Question question,
    int index,
    bool isSelected,
    void Function(int index) onTap,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.lightorange : AppColors.coolgray,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 2,
              color: isSelected ? AppColors.powerorange : AppColors.coolgray,
            ),
          ),
          child: Text(
            question.choices[index].choice_text,
            style: AppTextStyles.subheading.copyWith(
              color: isSelected ? AppColors.powerorange : AppColors.darkgray,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChoices(
    List<Question> questions,
    int index,
    int? selectedChoice,
    void Function(int index) onTap,
  ) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              _buildChoice(questions[index], 0, selectedChoice == 0, onTap),
              SizedBox(width: 8),
              _buildChoice(questions[index], 1, selectedChoice == 1, onTap),
            ],
          ),
        ),
        SizedBox(height: 8),
        Expanded(
          child: Row(
            children: [
              _buildChoice(questions[index], 2, selectedChoice == 2, onTap),
              SizedBox(width: 8),
              _buildChoice(questions[index], 3, selectedChoice == 3, onTap),
            ],
          ),
        ),
      ],
    );
  }
}
