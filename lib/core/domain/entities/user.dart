import 'package:studia/core/domain/entities/standard.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final String avatar;
  final int level;
  final int birthYear;
  final List<Map<Standard, dynamic>> performance;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.avatar,
    required this.level,
    required this.birthYear,
    required this.performance,
  });
}
