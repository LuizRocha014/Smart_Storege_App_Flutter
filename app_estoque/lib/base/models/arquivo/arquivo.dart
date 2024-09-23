import 'dart:convert';
import 'dart:typed_data';

import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';

class Arquivo extends Core {
  final String base64;
  Arquivo({
    required super.id,
    required super.inclusao,
    required this.base64,
  });
  Uint8List? get uint => base64Decode(base64);

  // factory Arquivo.fromJson(Map<String, dynamic> json) =>
  //     _$ArquivoFromJson(json);

  // Map<String, dynamic> toJson() => _$ArquivoToJson(this);

  static InfosTableDatabase get table {
    final columns = {
      "Base64": "TEXT",
    };

    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Arquivo', columns: columns);
  }
}
