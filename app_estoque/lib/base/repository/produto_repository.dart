import 'package:app_estoque/base/context/context.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoRepository {
  late Database db;

  _initDatabase() async {
    db = await DB.instance.database;
  }

  ProdutoRepository() {
    _initDatabase();
  }
}
