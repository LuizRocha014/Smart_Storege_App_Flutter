
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

mixin Conversores {
 static String formatarValorEmReal(double valor) {
    var formatador = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return formatador.format(valor);
  }
}