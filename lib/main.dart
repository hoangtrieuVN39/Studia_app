import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/services/drift/database.dart';
import 'package:studia/core/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  FlutterNativeSplash.remove();

  // final database = AppDatabase();

  // await database
  //     .into(database.standardsTable)
  //     .insert(
  //       StandardsTableCompanion.insert(
  //         name: 'todo: finish drift setup',
  //         description: Value(
  //           'We can now write queries and define our own tables.',
  //         ),
  //         level: 1,
  //         domain: 1,
  //         skill: 1,
  //       ),
  //     );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MaterialApp(
        title: 'Studia',
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
