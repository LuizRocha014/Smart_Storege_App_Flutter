import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';

@JsonSerializable()
class FileIMG extends Core {
  final String fileName;
  late String base64Arquiv;
  FileIMG(
      {required super.id,
      required super.createdAt,
      required super.active,
      required this.fileName,
      required this.base64Arquiv,
      required super.sync});

  factory FileIMG.fromJson(Map<String, dynamic> json) =>
      _$FileIMGFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$FileIMGToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "FileName": "TEXT",
      "Base64Arquiv": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'File', columns: columns);
  }
}
