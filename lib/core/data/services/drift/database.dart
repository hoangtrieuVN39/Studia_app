import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DataClassName('Standards')
class StandardsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get parentId => integer().nullable()();
  IntColumn get level => integer()();
  IntColumn get domain => integer()();
  IntColumn get skill => integer()();
  TextColumn get description => text().nullable()();
}

@DataClassName('Domains')
class DomainsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

@DataClassName('Skills')
class SkillsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get domain => integer()();
  IntColumn get level => integer()();
}

@DataClassName('Levels')
class LevelsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

@DriftDatabase(tables: [StandardsTable, DomainsTable, SkillsTable, LevelsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  Future<List<Standards>> selectStandards({
    int? id,
    int? parentId,
    int? level,
    int? domain,
    int? skill,
  }) async {
    final query = select(standardsTable);
    if (id != null) query.where((t) => t.id.equals(id));
    if (parentId != null) query.where((t) => t.parentId.equals(parentId));
    if (level != null) query.where((t) => t.level.equals(level));
    if (domain != null) query.where((t) => t.domain.equals(domain));
    if (skill != null) query.where((t) => t.skill.equals(skill));
    return await query.get();
  }

  Future<List<Domains>> selectDomains({int? standard_id}) async {
    final query = select(domainsTable);
    if (standard_id != null) {
      final standards =
          await (select(standardsTable)
            ..where((t) => t.id.equals(standard_id))).get();
      if (standards.isNotEmpty) {
        query.where((t) => t.id.equals(standards.first.domain));
      }
    }
    return await query.get();
  }

  Future<List<Skills>> selectSkills({int? id, int? domain, int? level}) async {
    final query = select(skillsTable);
    if (id != null) query.where((t) => t.id.equals(id));
    return await query.get();
  }

  Future<List<Levels>> selectLevels({int? id}) async {
    final query = select(levelsTable);
    if (id != null) query.where((t) => t.id.equals(id));
    return await query.get();
  }
}
