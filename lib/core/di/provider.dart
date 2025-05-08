import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}

class AppDatabaseProvider extends InheritedProvider<AppDatabase> {
  AppDatabase database;

  AppDatabaseProvider({super.key, required this.database})
    : super(create: (context) => database);

  void closeDatabase() async {
    await database.close();
  }
}
