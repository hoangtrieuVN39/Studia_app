import 'package:studia/core/domain/entities/user.dart';

abstract class LoginRepositoryRemote {
  Future<User?> getUser(String userId);
}
