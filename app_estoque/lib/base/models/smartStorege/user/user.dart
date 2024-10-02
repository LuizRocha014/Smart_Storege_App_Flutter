import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Core {
  final String roleId;
  final String name;
  final String email;
  final String userName;
  final DateTime emailVerifiedAt;
  final String password;
  final String rememberToken;

  User({
    required super.id,
    required super.createdAt,
    super.updatedAt,
    required this.roleId,
    required this.name,
    required this.userName,
    required this.email,
    required this.emailVerifiedAt,
    required this.password,
    required this.rememberToken,
    required super.active,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static InfosTableDatabase get table {
    final columns = {
      "RoleId": "TEXT",
      "Name": "TEXT",
      "Email": "TEXT",
      "UserName": "TEXT",
      "EmailVerifiedAt": "TEXT",
      "Password": "TEXT",
      "RememberToken": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'User', columns: columns);
  }
}
