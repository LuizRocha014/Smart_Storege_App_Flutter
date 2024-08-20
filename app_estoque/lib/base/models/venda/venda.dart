import 'package:app_estoque/base/models/core/core.dart';
import 'package:app_estoque/utils/mappers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'venda.g.dart';

@JsonSerializable()
class Venda extends Core {
  factory Venda.fromJson(Map<String, dynamic> json) =>
      _$VendaFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => fromJsonRepository(_$VendaToJson(this));
  Venda({required super.id, required super.inclusao});
}
