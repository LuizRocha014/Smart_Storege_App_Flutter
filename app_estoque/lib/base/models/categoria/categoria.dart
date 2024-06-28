import 'package:app_estoque/base/models/core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categoria.g.dart';

@JsonSerializable()
class Categoria extends Core {
  final String nome;
  Categoria({required super.id, required super.inclusao, required this.nome});

  factory Categoria.fromJson(Map<String, dynamic> json) => _$CategoriaFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriaToJson(this);
}
