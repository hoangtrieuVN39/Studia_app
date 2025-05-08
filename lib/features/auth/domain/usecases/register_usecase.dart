import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_remote.dart';

class RegisterUsecase {
  final LoginRepositoryRemote loginRepositoryRemote;
  final LoginRepositoryLocal loginRepositoryLocal;

  RegisterUsecase(this.loginRepositoryRemote, this.loginRepositoryLocal);

  Future<void> call(Map<String, dynamic> data) async {
    await loginRepositoryRemote.register(data);
    await loginRepositoryLocal.saveUser(data['id'], data['email'], data['newUser']);
  }
}

