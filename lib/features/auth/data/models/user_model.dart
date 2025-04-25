import 'package:studia/core/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.gender,
    required super.email,
    required super.avatar,
    required super.level,
    required super.birthYear,
    required super.performance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      email: json['email'],
      avatar: json['avatar'],
      level: json['level'],
      birthYear: json['birthYear'],
      performance: json['performance'],
    );
  }

  factory UserModel.copyWith(User user) {
    return UserModel(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      gender: user.gender,
      email: user.email,
      avatar: user.avatar,
      level: user.level,
      birthYear: user.birthYear,
      performance: user.performance,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'email': email,
    };
  }
}
