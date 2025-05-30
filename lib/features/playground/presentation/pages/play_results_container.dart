import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/playground/presentation/bloc/play_bloc.dart';

class PlayResultsContainer extends StatelessWidget {
  final PlayState state;
  final PlayBloc bloc;

  const PlayResultsContainer({
    super.key,
    required this.state,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (var question in state.questions) ...[
                  if (state.questions.indexOf(question) != 0)
                    SizedBox(height: 8),
                  Result(
                    index: state.questions.indexOf(question),
                    question: question.question,
                    answer: question.choices[question.answer].choice_text,
                    isCorrect:
                        question.answer ==
                        state.selectedChoices[state.questions.indexOf(
                          question,
                        )],
                    explanation: question.solution,
                  ),
                ],
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Correct ${state.correctAnswers} out of ${state.questions.length}!',
          style: AppTextStyles.h3.copyWith(color: AppColors.darkgray),
        ),
        SizedBox(height: 8),
        CustomButton(
          text: "Done",
          onPressed: () {
            bloc.add(PlayEvent.quitConfirmed());
          },
          type: AppButtonType.primary,
        ),
      ],
    );
  }
}

class Result extends StatefulWidget {
  final int index;
  final String question;
  final String answer;
  final bool isCorrect;
  final String explanation;

  const Result({
    super.key,
    required this.index,
    required this.question,
    required this.answer,
    required this.isCorrect,
    required this.explanation,
  });

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color:
              widget.isCorrect
                  ? AppColors.positiveLight
                  : AppColors.negativeLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text((widget.index + 1).toString()),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.question, style: AppTextStyles.subheading),
                  SizedBox(height: 8),
                  Text("Answer: ", style: AppTextStyles.subheading),
                  SizedBox(height: 4),
                  Text(widget.answer, style: AppTextStyles.body),
                  if (isExpanded) ...[
                    SizedBox(height: 8),
                    Text("Solution: ", style: AppTextStyles.subheading),
                    SizedBox(height: 4),
                    Text(widget.explanation, style: AppTextStyles.body),
                  ],
                ],
              ),
            ),
            SizedBox(width: 8),
            Icon(
              isExpanded
                  ? Icons.keyboard_arrow_right
                  : Icons.keyboard_arrow_down,
              color: AppColors.darkgray,
            ),
          ],
        ),
      ),
    );
  }
}
