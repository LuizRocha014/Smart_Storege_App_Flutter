import 'package:app_estoque/base/context/context.dart';
import 'package:app_estoque/utils/base_migration.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';

class AppContext extends Context {
  AppContext({
    required super.password,
  }) : super.nonFactoryConstructor(
          nameDatabase: _nameDatabase,
          version: _version,
          tables: _tables,
          migrations: _migrations,
        );
  static String get _nameDatabase => "APPESTOQUE";
  static int get _version => 1;
  static List<InfosTableDatabase> get _tables => [];

  static List<BaseMigration> get _migrations => [];
}
