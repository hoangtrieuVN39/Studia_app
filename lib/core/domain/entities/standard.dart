import 'package:studia/core/domain/entities/domain.dart';
import 'package:studia/core/domain/entities/level.dart';
import 'package:studia/core/domain/entities/skill.dart';

class Standard {
  final int id;
  final String name;
  final Level level;
  final Domain domain;
  final Skill skill;
  final String description;

  Standard({
    required this.id,
    required this.name,
    required this.level,
    required this.domain,
    required this.skill,
    required this.description,
  });
}
