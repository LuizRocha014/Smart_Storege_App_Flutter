import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:app_estoque/utils/mappers.dart';
import 'package:json_annotation/json_annotation.dart';

class Core {
  final String id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  @JsonKey(fromJson: fromJsonBoolean)
  final bool? active;

  Core(
      {required this.id,
      required this.createdAt,
      this.updatedAt,
      required this.active});

  static InfosTableDatabase get table => InfosTableDatabase(
        tableName: 'Core',
        columns: {
          "Id": "TEXT",
          "UpdatedAt": "TEXT",
          "CreatedAt": "TEXT",
          "Active": "INTEGER"
        },
      );
}
