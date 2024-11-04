import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

class Core {
  final String id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  @JsonKey(fromJson: fromJsonBoolean)
  final bool? active;
  @JsonKey(fromJson: fromJsonBoolean)
  late bool sync;

  Core(
      {required this.id,
      required this.createdAt,
      this.updatedAt,
      required this.sync,
      required this.active});

  static InfosTableDatabase get table => InfosTableDatabase(
        tableName: 'Core',
        columns: {
          "Id": "TEXT",
          "UpdatedAt": "TEXT",
          "CreatedAt": "TEXT",
          "Active": "INTEGER",
          "Sync": "INTEGER"
        },
      );
}
