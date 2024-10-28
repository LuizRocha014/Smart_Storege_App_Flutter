import 'package:app_estoque/base/models/smartStorege/Customer/costumer.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icostumer_repository.dart';
import 'package:app_estoque/modules/cliente/page/novo_cliente_page.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ClienteController extends BaseController {
  late RxList<Costumer> listCostumer;
  @override
  void iniciaControlador() {
    isLoading = true;
    listCostumer = RxList();
    carregaDados();
    isLoading = false;
  }

  Future<void> carregaDados() async {
    try {
      listCostumer.value =
          await instanceManager.get<ICostumerRepository>().getCostumers();
      listCostumer.refresh();
    } catch (_) {}
  }

  void novoCliente() {
    try {
      context.push(const NovoClientePage());
    } catch (_) {}
  }
}
