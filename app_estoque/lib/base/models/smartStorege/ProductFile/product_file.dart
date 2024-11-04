import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_file.g.dart';

@JsonSerializable()
class ProductFile extends Core {
  final String productId;
  final String fileId;
  final String description;
  ProductFile(
      {required super.id,
      required super.createdAt,
      required super.active,
      required this.productId,
      required this.fileId,
      required this.description,
      required super.sync});

  factory ProductFile.fromJson(Map<String, dynamic> json) =>
      _$ProductFileFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$ProductFileToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "ProductId": "TEXT",
      "FileId": "TEXT",
      "Description": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'ProductFile', columns: columns);
  }
}
