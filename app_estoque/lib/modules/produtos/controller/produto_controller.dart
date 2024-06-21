import 'package:app_estoque/base/models/produtos.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:get/get.dart';

class ProdutoController extends BaseController {
  late RxList<Produto> produtos;
  @override
  void iniciaControlador() {
    produtos = RxList([]);
  }
}
