import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/repository/interface/iproduto_repository.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/modules/vendas/page/nova_venda_page.dart';
import 'package:app_estoque/utils/routes.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:get/get.dart';

class SelectItensController extends BaseController {
  late RxList<Product> _listProdutos;
  late List<Product> _itensSelecionados;
  late RxInt _contador;
  @override
  Future<void> iniciaControlador() async {
    _listProdutos = RxList();
    _itensSelecionados = [];
    _contador = 0.obs;
    carregaLista();
  }

  List<Product> get listProdutos => _listProdutos;
  List<Product> get itemSelecionado => _itensSelecionados;
  int get contador => _contador.value;

  Future<void> carregaLista() async {
    try {
      _listProdutos.value =
          await instanceManager.get<IProductRepository>().getAll();
      _listProdutos.refresh();
    } catch (_) {}
  }

  void adicionaItemCompra(int index) {
    try {
      final item = listProdutos[index];
      item.numbProduct++;
      _contador.value++;
      _listProdutos.refresh();
    } catch (_) {}
  }

  void removeItemCompra(int index) {
    try {
      final item = listProdutos[index];
      if (item.numbProduct > 0) {
        item.numbProduct--;
        _contador--;
      }
      _listProdutos.refresh();
    } catch (_) {}
  }

  Future<void> avancaPaginaItens() async {
    try {
      _itensSelecionados =
          _listProdutos.where((e) => e.numbProduct > 0).toList();
      context.push(const NovaVendaPage());
    } catch (_) {}
  }
}
