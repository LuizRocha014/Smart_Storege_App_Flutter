import 'package:app_estoque/modules/cliente/page/novo_cliente_page.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/routes.dart';

class ClienteController extends BaseController {
  @override
  void iniciaControlador() {}
  void novoCliente() {
    try {
      context.push(const NovoClientePage());
    } catch (_) {}
  }
}
