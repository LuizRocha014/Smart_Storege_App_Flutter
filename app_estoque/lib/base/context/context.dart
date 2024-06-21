import 'package:app_estoque/base/models/acesso/acesso.dart';
import 'package:app_estoque/base/models/produtos.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();
  static final DB instance = DB._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), "App_estoque.db"),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(Acessos.table.createTable);
    await db.execute(Produto.table.createTable);
  }

  Future<void> insertOrReplace<T>(String tableName, T item) async {
    final db = await instance.database;
    await db.insert(
      tableName,
      item as Map<String,
          Object?>, // Certifique-se de que o item pode ser convertido em Map<String, dynamic>
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
