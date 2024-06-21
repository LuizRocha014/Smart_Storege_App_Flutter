import 'package:app_estoque/base/models/core/core.dart';

class Categoria extends Core {
  final String nome;
  Categoria({required super.id, required super.inclusao, required this.nome});
}
