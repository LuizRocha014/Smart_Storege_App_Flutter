import 'package:app_estoque/base/models/smartStorege/Customer/costumer.dart';
import 'package:app_estoque/modules/cliente/page/novo_cliente_page.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/routes.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ClienteController extends BaseController {
  late RxList<Costumer> listCostumer;
  @override
  void iniciaControlador() {
    listCostumer = RxList();
  }

  void novoCliente() {
    try {
      context.push(const NovoClientePage());
    } catch (_) {}
  }
}
