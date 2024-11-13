import 'package:app_estoque/utils/assets.dart';
import 'package:json_annotation/json_annotation.dart';

enum TipoTransacao {
  sale,
  buy,
}

enum TipoPagamento {
  @JsonValue(0)
  pix("PIX", iconPix),
  @JsonValue(1)
  dinheiro("DINHEIRO", iconDinheiro),
  @JsonValue(2)
  debito("DÉBITO", iconCartao),
  @JsonValue(3)
  credito("CRÉDITO", iconCartao);

  final String name;
  final String icon;

  const TipoPagamento(this.name, this.icon);
}
