import 'package:app_estoque/modules/cliente/page/cliente_page.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/routes.dart';

class NovaVendaController extends BaseController {
  @override
  void iniciaControlador() {}

  void selectCliente() {
    try {
      context.push(const ClientePage());
    } catch (_) {}
  }
}
