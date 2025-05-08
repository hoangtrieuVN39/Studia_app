// import 'package:drift/drift.dart';

// @DriftDao(tables: [StandardsTable])
// abstract class StandardsDao {
//   @Query('SELECT * FROM standards')
//   Future<List<StandardsTable>> getStandards();

//   @Query('SELECT * FROM standards WHERE id = :id')
//   Future<StandardsTable?> getStandardById(int id);

//   @Query('SELECT * FROM standards WHERE parentId = :parentId')
//   Future<List<StandardsTable>> getStandardsByParentId(int parentId);

//   @Query('SELECT * FROM standards WHERE domain = :domain')
//   Future<List<StandardsTable>> getStandardsByDomain(int domain);

//   @Query('SELECT * FROM standards WHERE skill = :skill')
//   Future<List<StandardsTable>> getStandardsBySkill(int skill);

//   @Query('SELECT * FROM standards WHERE level = :level')
//   Future<List<StandardsTable>> getStandardsByLevel(int level);

//   @Query('SELECT * FROM standards WHERE parentId IS NULL')
//   Future<List<StandardsTable>> getRootStandards();

// }
