// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:studia/core/data/datasources/local/drift/database.dart' as _i79;
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart'
    as _i797;
import 'package:studia/core/data/datasources/remote/dio_service.dart' as _i280;
import 'package:studia/core/data/repositories/websocket_repository_impl.dart'
    as _i382;
import 'package:studia/core/di/provider.dart' as _i312;
import 'package:studia/core/domain/repositories/websocket_repository.dart'
    as _i87;
import 'package:studia/core/domain/usecases/websocket/connect_websocket.dart'
    as _i227;
import 'package:studia/core/domain/usecases/websocket/disconnect_websocket.dart'
    as _i871;
import 'package:studia/core/domain/usecases/websocket/get_websocket_stream.dart'
    as _i352;
import 'package:studia/core/domain/usecases/websocket/send_websocket_message.dart'
    as _i341;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefsModule = _$SharedPrefsModule();
    final sharedPrefsManagerModule = _$SharedPrefsManagerModule();
    final dioModule = _$DioModule();
    final userModule = _$UserModule();
    final appDatabaseModule = _$AppDatabaseModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPrefsModule.prefs,
      preResolve: true,
    );
    await gh.singletonAsync<_i797.SharedPrefsManager>(
      () => sharedPrefsManagerModule.sharedPrefsManager,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i280.DioService>(
      () => dioModule.dioService,
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
    gh.lazySingleton<_i87.WebSocketRepository>(
      () => _i382.WebSocketRepositoryImpl(),
    );
    gh.lazySingleton<_i227.ConnectWebSocket>(
      () => _i227.ConnectWebSocket(gh<_i87.WebSocketRepository>()),
    );
    gh.lazySingleton<_i871.DisconnectWebSocket>(
      () => _i871.DisconnectWebSocket(gh<_i87.WebSocketRepository>()),
    );
    gh.lazySingleton<_i352.GetWebSocketStream>(
      () => _i352.GetWebSocketStream(gh<_i87.WebSocketRepository>()),
    );
    gh.lazySingleton<_i341.SendWebSocketMessage>(
      () => _i341.SendWebSocketMessage(gh<_i87.WebSocketRepository>()),
    );
    return this;
  }
}

class _$SharedPrefsModule extends _i797.SharedPrefsModule {}

class _$SharedPrefsManagerModule extends _i797.SharedPrefsManagerModule {}

class _$DioModule extends _i280.DioModule {}

class _$UserModule extends _i312.UserModule {}

class _$AppDatabaseModule extends _i312.AppDatabaseModule {}
