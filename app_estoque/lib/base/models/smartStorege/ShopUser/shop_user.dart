import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:app_estoque/utils/mappers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_user.g.dart';

@JsonSerializable()
class ShopUser extends Core {
  final String userId;
  final String shopId;
  @JsonKey(fromJson: fromJsonBoolean)
  final bool userMainShop;
  ShopUser({
    required this.userId,
    required this.shopId,
    required this.userMainShop,
    required super.id,
    required super.createdAt,
    required super.active,
  });

  factory ShopUser.fromJson(Map<String, dynamic> json) =>
      _$ShopUserFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$ShopUserToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "userId": "TEXT",
      "shopId": "TEXT",
      "userMainShop": "INTEGER",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'ShopUser', columns: columns);
  }
}
