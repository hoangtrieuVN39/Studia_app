import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';

class UserModel extends User {
  final int? parseLevelId;

  UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.gender,
    required super.email,
    super.avatar,
    this.parseLevelId,
    required super.birthYear,
    required super.performance,
    Levels? level,
  }) : super(level: level);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      gender: json['gender'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      birthYear: json['birth_year'] as int,
      performance:
          (json['performance'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
      parseLevelId: json['level_id'] as int,
      level: null,
    );
  }

  factory UserModel.fromUser(User user) {
    return UserModel(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      gender: user.gender,
      email: user.email,
      avatar: user.avatar,
      birthYear: user.birthYear,
      performance: user.performance,
      level: user.level,
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

  User copyWithResolvedLevel(Levels? resolvedLevel) {
    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      email: email,
      avatar: avatar,
      birthYear: birthYear,
      performance: performance,
      level: resolvedLevel,
    );
  }

  Map<String, dynamic> toJson({
    String? id,
    String? firstName,
    String? lastName,
    String? gender,
    String? email,
    String? avatar,
    int? birthYear,
    List<double>? performance,
    int? level,
  }) {
    return {
      'id': id ?? this.id,
      'first_name': firstName ?? this.firstName,
      'last_name': lastName ?? this.lastName,
      'gender': gender ?? this.gender,
      'email': email ?? this.email,
      'avatar': avatar ?? this.avatar,
      'birth_year': birthYear ?? this.birthYear,
      'performance': performance ?? this.performance,
      'level_id': level ?? this.level,
    };
  }
}
