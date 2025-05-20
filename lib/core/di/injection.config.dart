// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:studia/core/data/datasources/local/drift/database.dart' as _i79;
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart'
    as _i797;
import 'package:studia/core/di/provider.dart' as _i312;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefsModule = _$SharedPrefsModule();
    final sharedPrefsManagerModule = _$SharedPrefsManagerModule();
    final userModule = _$UserModule();
    final appDatabaseModule = _$AppDatabaseModule();
    final dioServiceModule = _$DioServiceModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPrefsModule.prefs,
      preResolve: true,
    );
    await gh.singletonAsync<_i797.SharedPrefsManager>(
      () => sharedPrefsManagerModule.sharedPrefsManager,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i312.UserProvider>(
      () => userModule.userProvider,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i79.AppDatabase>(
      () => appDatabaseModule.appDatabase,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i361.Dio>(
      () => dioServiceModule.dioService,
      preResolve: true,
    );
    return this;
  }
}

class _$SharedPrefsModule extends _i797.SharedPrefsModule {}

class _$SharedPrefsManagerModule extends _i797.SharedPrefsManagerModule {}

class _$UserModule extends _i312.UserModule {}

class _$AppDatabaseModule extends _i312.AppDatabaseModule {}

class _$DioServiceModule extends _i312.DioServiceModule {}
