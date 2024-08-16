import 'package:app_estoque/base/models/produtos/produtos.dart';
import 'package:app_estoque/base/repository/interface/iproduto_repository.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:get/get.dart';

class SelectItensController extends BaseController {
  late RxList<Produto> _listProdutos;
  late RxInt _contador;
  @override
  Future<void> iniciaControlador() async {
    _listProdutos = RxList();
    _contador = 0.obs;
    carregaLista();
  }

  List<Produto> get listProdutos => _listProdutos;
  int get contador => _contador.value;

  Future<void> carregaLista() async {
    try {
      _listProdutos.value =
          await instanceManager.get<IProdutoRepository>().getAll();
      _listProdutos.refresh();
    } catch (_) {}
  }

  void adicionaItemCompra(int index) {
    try {
      final item = listProdutos[index];
      item.quantidadeVenda++;
      _contador.value++;
      _listProdutos.refresh();
    } catch (_) {}
  }

  void removeItemCompra(int index) {
    try {
      final item = listProdutos[index];
      if (item.quantidadeVenda > 0) {
        item.quantidadeVenda--;
        _contador--;
      }
      _listProdutos.refresh();
    } catch (_) {}
  }

  Future<void> adicionaItemCarrinho() async {
    try {} catch (_) {}
  }
}
