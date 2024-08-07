import 'package:app_estoque/base/models/core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:app_estoque/utils/mappers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categoria.g.dart';

@JsonSerializable()
class Categoria extends Core {
  final String nome;
  Categoria({required super.id, required super.inclusao, required this.nome});

  static InfosTableDatabase get table {
    final columns = {
      "Nome": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Categoria', columns: columns);
  }

  factory Categoria.fromJson(Map<String, dynamic> json) =>
      _$CategoriaFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => _$CategoriaToJson(this);
}
