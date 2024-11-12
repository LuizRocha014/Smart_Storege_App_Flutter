import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

enum TipoTransacao {
  sale,
  buy,
}

enum TipoPagamento {
  @JsonValue(0)
  pix("PIX", ""),
  @JsonValue(1)
  dinheiro("DINHEIRO", ""),
  @JsonValue(2)
  debito("DÉBITO", ""),
  @JsonValue(3)
  credito("CRÉDITO", "");

  final String name;
  final String icon;

  const TipoPagamento(this.name, this.icon);
}
