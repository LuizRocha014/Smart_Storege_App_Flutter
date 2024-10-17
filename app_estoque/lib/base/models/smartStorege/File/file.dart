import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:app_estoque/utils/mappers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';

@JsonSerializable()
class FileIMG extends Core {
  final String fileName;
  final String base64Arquiv;
  FileIMG(
      {required super.id,
      required super.createdAt,
      required super.active,
      required this.fileName,
      required this.base64Arquiv});

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
