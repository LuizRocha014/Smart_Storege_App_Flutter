import 'package:app_estoque/base/dto/product_dto/product_dto.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_repository.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:get/get.dart';

class ProdutoController extends BaseController {
  late RxList<ProdutctDto> _produtos;
  @override
  void iniciaControlador() {
    _produtos = RxList();
    carregaDados();
  }

  List<ProdutctDto> get listProdutos => _produtos;

  Future<void> carregaDados() async {
    try {
      _produtos.value =
          await instanceManager.get<IProductRepository>().getProdutos();
    } catch (_) {}
  }
}
