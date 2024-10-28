import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Core {
  final String description;
  Category({
    required super.id,
    required super.createdAt,
    required this.description,
    required super.active,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$CategoryToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "Description": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Category', columns: columns);
  }
}
