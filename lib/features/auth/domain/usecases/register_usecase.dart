import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_remote.dart';

class RegisterUsecase {
  final LoginRepositoryRemote loginRepositoryRemote;
  final LoginRepositoryLocal loginRepositoryLocal;

  RegisterUsecase(this.loginRepositoryRemote, this.loginRepositoryLocal);

  Future<bool> call(
    String id,
    String email,
    String firstName,
    String lastName,
    String gender,
    int birthYear,
    Levels level,
    List<Domains> domains,
  ) async {
    print(
      'Register data before processing: $id, $email, $firstName, $lastName, $gender, $birthYear, $level, $domains',
    );

    // Extract domain IDs from the Domains objects
    final List<int> domainIds =
        (domains as List).map((domain) => domain.domain_id as int).toList();

    // Create a new map with the processed data
    final processedData = {
      'user_id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'birth_year': birthYear,
      'level_id': level.level_id,
      'domains': domainIds,
    };

    print('Processed register data: $processedData');
    final result = await loginRepositoryRemote.register(processedData);
    if (result) {
      await loginRepositoryLocal.saveUser(id, email);
    }
    return result;
  }
}
