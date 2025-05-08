import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/data/datasources/local/shared-prefs_manager.dart';

import 'package:studia/firebase_options.dart';

final getIt = GetIt.instance;

void setup() async {
  getIt.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  await getIt.isReady<SharedPreferences>();
  getIt.registerLazySingleton<SharedPrefsManager>(
    () => SharedPrefsManager(getIt<SharedPreferences>()),
  );
  await getIt<SharedPrefsManager>().init();

  getIt.registerLazySingleton<UserProvider>(() => UserProvider());
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  getIt.registerLazySingleton<AppDatabaseProvider>(
    () => AppDatabaseProvider(database: getIt<AppDatabase>()),
  );
}

void main() async {
  FlutterNativeSplash.remove();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studia',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes(),
    );
  }
}
