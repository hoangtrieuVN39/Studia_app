import 'package:dartz/dartz.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/core/error/failures.dart';
import 'package:studia/features/auth/data/models/user_model.dart';

abstract class LoginRepositoryLocal {
  Future<User?> getUser();
  Future<void> saveUser(User user);
}
