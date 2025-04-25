import 'package:studia/core/domain/entities/domain.dart';
import 'package:studia/core/domain/entities/level.dart';

class Skill {
  final int id;
  final String name;
  final Level level;
  final Domain domain;

  Skill({
    required this.id,
    required this.name,
    required this.level,
    required this.domain,
  });
}
