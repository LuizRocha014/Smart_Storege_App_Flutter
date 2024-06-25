import 'package:sqflite/sqflite.dart';

abstract class IContext {
  Future<Database> initializeDatabase({String? path});

  //Future<bool> exportDatabase(BuildContext context);

  Future<bool> deleteDb();

  Future<void> deleteDbValues();

  Future<int> rawUpdate(String sql, [List<Object?>? arguments]);

  Future<int> rawDelete(String sql, [List<Object?>? arguments]);

  Future<int> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
    ConflictAlgorithm? conflictAlgorithm,
  });

  Future<int> insert(
    String table,
    Map<String, Object?> values, {
    String? nullColumnHack,
    ConflictAlgorithm? conflictAlgorithm,
  });

  Future<List<Map<String, Object?>>> rawQuery(String sql, [List<Object?>? arguments]);
  Future<void> execute(String sql, [List<Object?>? arguments]);
  Future<void> transaction<T>(Future<T> Function(Transaction txn) action);
}
