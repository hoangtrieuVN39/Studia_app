import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

@DataClassName('Standards')
class StandardsTable extends Table {
  IntColumn get standard_id => integer()();
  TextColumn get standard => text()();
  IntColumn get parent_id => integer().nullable()();
  IntColumn get level => integer()();
  IntColumn get domain => integer()();
  IntColumn get skill => integer()();
  TextColumn get description => text().nullable()();
}

@DataClassName('Domains')
class DomainsTable extends Table {
  IntColumn get domain_id => integer()();
  TextColumn get domain_name => text()();
}

@DataClassName('Skills')
class SkillsTable extends Table {
  IntColumn get skill_id => integer()();
  TextColumn get skill_name => text()();
  IntColumn get domain => integer()();
  IntColumn get level => integer()();
}

@DataClassName('Levels')
class LevelsTable extends Table {
  IntColumn get level_id => integer()();
  TextColumn get level_name => text()();
}

@DriftDatabase(tables: [StandardsTable, DomainsTable, SkillsTable, LevelsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection()) {
    verifyDatabaseIntegrity();
  }

  @override
  int get schemaVersion => 1;

  Future<List<Standards>> selectStandards({
    int? standard_id,
    int? parent,
    int? level,
    int? domain,
    int? skill,
  }) async {
    final query = select(standardsTable);
    if (standard_id != null)
      query.where((t) => t.standard_id.equals(standard_id));
    if (parent != null) query.where((t) => t.parent_id.equals(parent));
    if (level != null) query.where((t) => t.level.equals(level));
    if (domain != null) query.where((t) => t.domain.equals(domain));
    if (skill != null) query.where((t) => t.skill.equals(skill));
    return await query.get();
  }

  Future<List<Domains>> selectDomains() async {
    final query = select(domainsTable);
    return await query.get();
  }

  Future<List<Skills>> selectSkills({
    int? skill_id,
    int? domain,
    int? level,
  }) async {
    final query = select(skillsTable);
    if (skill_id != null) query.where((t) => t.skill_id.equals(skill_id));
    if (domain != null) query.where((t) => t.domain.equals(domain));
    if (level != null) query.where((t) => t.level.equals(level));
    return await query.get();
  }

  Future<List<Levels>> selectLevels({int? id}) async {
    // final query = select(levelsTable);
    // if (id != null) query.where((t) => t.id.equals(id));
    // final ret = await query.get();
    // return ret;
    return await select(levelsTable).get();
  }

  Future<bool> verifyDatabaseIntegrity() async {
    try {
      // Try to query each table
      final standards = await selectStandards();
      final domains = await selectDomains();
      final skills = await selectSkills();
      final levels = await selectLevels();

      // Log the counts (optional)
      print('Database verification:');
      print('Standards: ${standards.length}');
      print('Domains: ${domains.length}');
      print('Skills: ${skills.length}');
      print('Levels: ${levels.length}');

      return true;
    } catch (e) {
      print('Database verification failed: $e');
      return false;
    }
  }
}

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     try {
//       final dbFolder = '${(await getExternalStorageDirectory())!.path}/Studia/';
//       final file = File(p.join(dbFolder, 'db.sqlite'));

//       if (!await file.exists()) {
//         await file.parent.create(recursive: true);

//         final data = await rootBundle.load('assets/curriculum/db.sqlite');
//         await file.writeAsBytes(
//           data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
//           flush: true,
//         );
//         print('Database copied from assets successfully');
//       } else {
//         print('Using existing database file');
//       }

//       return NativeDatabase(file, logStatements: true);
//     } catch (e) {
//       print('Error initializing database: $e');
//       rethrow;
//     }
//   });
// }

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'database.db'));

    if (!await file.exists()) {
      final blob = await rootBundle.load('assets/curriculum/database.db');
      final buffer = blob.buffer;
      await file.writeAsBytes(
        buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes),
      );
    }

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    return NativeDatabase.createInBackground(file);
  });
}
