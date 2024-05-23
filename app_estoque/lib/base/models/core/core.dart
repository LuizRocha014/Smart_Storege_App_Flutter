import 'package:app_estoque/utils/infos_tabela_database.dart';

class Core {
  final String id;
  final DateTime inclusao;
  final DateTime? alteracao;

  Core({required this.id, required this.inclusao, this.alteracao});

  static InfosTableDatabase get table => InfosTableDatabase(
        tableName: 'Core',
        columns: {"id": "TEXT", "inclusao": "TEXT", "alteracao": "TEXT"},
      );
}
