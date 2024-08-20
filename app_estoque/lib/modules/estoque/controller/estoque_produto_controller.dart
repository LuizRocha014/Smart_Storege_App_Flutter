import 'package:app_estoque/base/models/produtos/produto.dart';
import 'package:app_estoque/base/repository/interface/iproduto_repository.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:get/get.dart';

class EstoqueProdutoController extends BaseController {
  late RxList<Produto> _listProdutos;
  @override
  Future<void> iniciaControlador() async {
    _listProdutos = RxList();
    carregaDados();
  }

  List<Produto> get produtosEstoque => _listProdutos;

  Future<void> carregaDados() async {
    try {
      _listProdutos.value =
          await instanceManager.get<IProdutoRepository>().getAll();
      _listProdutos.refresh();
    } catch (_) {}
  }

  void adicionaItemCompra(int index) {
    try {
      final item = produtosEstoque[index];
      item.numbProduct++;
      _listProdutos.refresh();
    } catch (_) {}
  }
}