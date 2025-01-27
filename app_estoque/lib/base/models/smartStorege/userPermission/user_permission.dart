import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:app_estoque/utils/mappers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_permission.g.dart';

@JsonSerializable()
class UserPermission extends Core {
  final String usuarioId;
  final String acessoId;

  UserPermission(
      {required super.id,
      required super.createdAt,
      required this.acessoId,
      required this.usuarioId,
      required super.active});

  factory UserPermission.fromJson(Map<String, dynamic> json) =>
      _$UserPermissionFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() =>
      toJsonRepository(_$UserPermissionToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "UsuarioId": "TEXT",
      "AcessoId": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'User_Permission', columns: columns);
  }
}
