import 'package:app_estoque/base/models/core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'venda.g.dart';

@JsonSerializable()
class Venda extends Core {
  Venda({required super.id, required super.inclusao});
}
