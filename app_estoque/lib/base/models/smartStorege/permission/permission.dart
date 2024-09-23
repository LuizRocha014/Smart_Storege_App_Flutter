import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class Permission extends Core {
  final String name;
  Permission({
    required super.id,
    required this.name,
    required super.inclusao,
  });

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionToJson(this);
  static InfosTableDatabase get table {
    final columns = {
      "Name": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Permission', columns: columns);
  }
}
