import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

class UserProvider {
  User? _user;
  User? get user => _user;

  UserProvider() {}

  void setUser(User user) {
    _user = user;
  }
}

@module
abstract class UserModule {
  @preResolve
  @lazySingleton
  Future<UserProvider> get userProvider async => UserProvider();
}

@module
abstract class AppDatabaseModule {
  @preResolve
  @lazySingleton
  Future<AppDatabase> get appDatabase async => AppDatabase();
}
