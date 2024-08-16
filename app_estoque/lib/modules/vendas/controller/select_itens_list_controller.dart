import 'package:app_estoque/base/models/produtos/produtos.dart';
import 'package:app_estoque/base/repository/interface/iproduto_repository.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:get/get.dart';

class SelectItensController extends BaseController {
  late RxList<Produto> _listProdutos;
  @override
  Future<void> iniciaControlador() async {
    _listProdutos = RxList();
    carregaLista();
  }

  List<Produto> get listProdutos => _listProdutos;

  Future<void> carregaLista() async {
    try {
      _listProdutos.value =
          await instanceManager.get<IProdutoRepository>().getAll();
      _listProdutos.refresh();
    } catch (_) {}
  }

  Future<void> adicionaItemCarrinho() async {
    try {} catch (_) {}
  }
}
