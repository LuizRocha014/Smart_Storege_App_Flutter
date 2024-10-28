import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class Permission extends Core {
  final String name;
  Permission({
    required super.id,
    required this.name,
    super.updatedAt,
    required super.createdAt,
    required super.active,
  });

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$PermissionToJson(this));
  static InfosTableDatabase get table {
    final columns = {
      "Name": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Permission', columns: columns);
  }
}
