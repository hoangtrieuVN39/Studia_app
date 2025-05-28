import 'package:studia/features/playground/domain/entities/choice.dart';

class ChoiceModel extends Choice {
  ChoiceModel({
    required super.choice_number,
    required super.choice_text,
  });

  factory ChoiceModel.fromJson(Map<String, dynamic> json) {
    return ChoiceModel(
      choice_number: json['choice_number'] as int,
      choice_text: json['choice_text'] as String,
    );
  }
}