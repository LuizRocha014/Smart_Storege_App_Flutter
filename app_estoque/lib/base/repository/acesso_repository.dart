import 'package:app_estoque/base/context/context.dart';
import 'package:sqflite/sqflite.dart';

class AcessoRepository {
  late Database database;

  _initState() async {
    database = await DB.instance.database;
  }

  AcessoRepository() {
    _initState();
  }
}
