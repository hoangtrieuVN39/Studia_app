import 'package:studia/core/domain/entities/user.dart';

class UserUpdateModel {
  String id;
  String firstName;
  String lastName;
  String gender;
  int birthYear;
  List<double> performance;
  int level;

  UserUpdateModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthYear,
    required this.performance,
    required this.level,
  });

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) {
    return UserUpdateModel(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      gender: json['gender'] as String,
      birthYear: json['birth_year'] as int,
      performance:
          (json['performance'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
      level: json['level'] as int,
    );
  }

  factory UserUpdateModel.fromUser(User user) {
    return UserUpdateModel(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      gender: user.gender,
      birthYear: user.birthYear,
      performance: user.performance,
      level: user.level?.level_id ?? 0,
    );
  }

  toUpdateJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'birth_year': birthYear,
      'level_id': level,
    };
  }
}
