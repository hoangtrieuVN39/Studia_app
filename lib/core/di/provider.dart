import 'package:dio/dio.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

class UserProvider {
  User? _user;
  User? get user => _user;

  void setUser(User user) {
    _user = user;
  }
}

@module
abstract class UserModule {
  @preResolve
  @lazySingleton
  UserProvider get userProvider => UserProvider();
}

@module
abstract class AppDatabaseModule {
  @preResolve
  @lazySingleton
  Future<AppDatabase> get appDatabase async => AppDatabase();
}

@module
abstract class DioServiceModule {
  @preResolve
  @lazySingleton
  Future<Dio> get dioService async => Dio();
}
