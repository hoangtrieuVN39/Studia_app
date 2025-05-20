import 'package:studia/core/data/datasources/local/drift/database.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final String avatar;
  final Levels? level;
  final int birthYear;
  final List<double> performance;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.avatar,
    this.level,
    required this.birthYear,
    required this.performance,
  });

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? gender,
    String? email,
    String? avatar,
    Levels? level,
    int? birthYear,
    List<double>? performance,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      level: level ?? this.level,
      birthYear: birthYear ?? this.birthYear,
      performance: performance ?? this.performance,
    );
  }
}
