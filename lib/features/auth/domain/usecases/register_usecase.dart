import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_remote.dart';

class RegisterUsecase {
  final LoginRepositoryRemote loginRepositoryRemote;
  final LoginRepositoryLocal loginRepositoryLocal;

  RegisterUsecase(this.loginRepositoryRemote, this.loginRepositoryLocal);

  Future<bool> call(Map<String, dynamic> data) async {
    final result = await loginRepositoryRemote.register(data);
    if (result) {
      await loginRepositoryLocal.saveUser(data['id'], data['email']);
    }
    return result;
  }
}
