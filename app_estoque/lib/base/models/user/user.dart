import 'package:app_estoque/base/models/core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Core {
  String name;
  String email;
  String password;
  int? roleId;

  User({
    required this.name,
    required this.email,
    required this.password,
    this.roleId,
    required super.id,
    required super.inclusao,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
  static InfosTableDatabase get table {
    final columns = {
      "name": "TEXT",
      "email": "TEXT",
      "password": "TEXT",
      "roleId": "INT",
      "Email": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'User', columns: columns);
  }
}
