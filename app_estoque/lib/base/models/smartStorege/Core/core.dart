import 'package:app_estoque/utils/infos_tabela_database.dart';

class Core {
  final String id;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Core({required this.id, required this.createdAt, this.updatedAt});

  static InfosTableDatabase get table => InfosTableDatabase(
        tableName: 'Core',
        columns: {"Id": "TEXT", "UpdatedAt": "TEXT", "CreatedAt": "TEXT"},
      );
}
