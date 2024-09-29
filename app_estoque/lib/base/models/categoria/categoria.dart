import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Categoria extends Core {
  Categoria({required super.id, required super.createdAt});
}
