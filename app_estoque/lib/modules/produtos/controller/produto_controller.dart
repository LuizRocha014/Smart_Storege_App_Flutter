import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/repository/interface/iproduto_repository.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:get/get.dart';

class ProdutoController extends BaseController {
  late RxList<Product> _produtos;
  @override
  void iniciaControlador() {
    _produtos = RxList([]);
    carregaDados();
  }

  List<Product> get listProdutos => _produtos;

  Future<void> carregaDados() async {
    try {
      _produtos.value =
          await instanceManager.get<IProductRepository>().getProdutos();
    } catch (_) {}
  }
}
