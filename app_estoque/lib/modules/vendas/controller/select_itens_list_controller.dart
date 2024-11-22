import 'dart:developer';

import 'package:app_estoque/base/models/dto/product_dto/product_dto.dart';
import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_repository.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/modules/vendas/page/nova_venda_page.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class SelectItensController extends BaseController {
  late RxList<ProdutctDto> _listProdutos;
  late List<Product> _itensSelecionados;
  late RxInt _contador;
  late RxBool filtro;
  @override
  Future<void> iniciaControlador() async {
    _listProdutos = RxList();
    filtro = RxBool(false);
    _itensSelecionados = [];
    _contador = 0.obs;
    carregaLista();
  }

  List<ProdutctDto> get listProdutos => _listProdutos;
  List<Product> get itemSelecionado => _itensSelecionados;
  int get contador => _contador.value;

  Future<void> carregaLista() async {
    try {
      isLoading = true;
      await instanceManager
          .get<IProductRepository>()
          .getProdutos()
          .then(_listProdutos.call);
    } catch (_) {
    } finally {
      isLoading = false;
    }
  }

  void adicionaItemCompra(int index, int indexProd) {
    try {
      final item = listProdutos[index].listProduct![indexProd];
      if (item.quantity! > item.numbProduct) {
        item.numbProduct++;
        _contador.value++;
        _listProdutos.refresh();
      }
    } catch (_) {}
  }

  void removeItemCompra(int index, int indexProd) {
    try {
      final item = listProdutos[index].listProduct![indexProd];
      if (item.numbProduct > 0) {
        item.numbProduct--;
        _contador--;
      }
      _listProdutos.refresh();
    } catch (_) {}
  }

  Future<void> avancaPaginaItens() async {
    try {
      for (var categoria in _listProdutos) {
        for (var element in categoria.listProduct!) {
          if (element.numbProduct > 0) _itensSelecionados.add(element);
        }
      }
      context.push(const NovaVendaPage());
    } catch (e) {
      log(e.toString());
    }
  }

  void buscaProduto() async {
    await startBarcodeScanStream(context);
    final qrCode = QrCode.fromData(
      data: "",
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );
    _listProdutos.where((e) => e.codProduct == qrCode.toString());
    _listProdutos.refresh();
  }
}
