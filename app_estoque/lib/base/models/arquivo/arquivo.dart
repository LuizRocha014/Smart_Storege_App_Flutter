import 'package:app_estoque/base/models/core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'arquivo.g.dart';

@JsonSerializable()
class Arquivo extends Core {
  final String base64;
  Arquivo({
    required super.id,
    required super.inclusao,
    required this.base64,
  });

  factory Arquivo.fromJson(Map<String, dynamic> json) =>
      _$ArquivoFromJson(json);

  Map<String, dynamic> toJson() => _$ArquivoToJson(this);

  static InfosTableDatabase get table {
    final columns = {
      "Base64": "TEXT",
    };

    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Arquivo', columns: columns);
  }
}
