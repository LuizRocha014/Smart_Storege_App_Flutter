import 'dart:developer';

import 'package:app_estoque/base/models/list_menu_Iniciar.dart';
import 'package:app_estoque/modules/estoque/page/estoque_produto_page.dart';
import 'package:app_estoque/modules/listaVendas/page/lista_vendas_page.dart';
import 'package:app_estoque/modules/produtos/page/produtos_page.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/assets.dart';
import 'package:flutter/material.dart';

class MenuPrincipalController extends BaseController {
  late final List<ListOpcoesMenu> listMenuInicial;

  @override
  void iniciaControlador() {
    listMenuInicial = [];
    carregaDados();
  }

  void carregaDados() {
    try {
      listMenuInicial.add(ListOpcoesMenu(
          nome: 'Vendas',
          image: AssetsAplicativo.iconVendas,
          gestureCommand: 'GestureVendas'));
      listMenuInicial.add(ListOpcoesMenu(
          nome: 'Estoque',
          image: AssetsAplicativo.iconEstoque,
          gestureCommand: 'GestureEstoque'));
      listMenuInicial.add(ListOpcoesMenu(
          nome: 'Produtos',
          image: AssetsAplicativo.iconProdutos,
          gestureCommand: 'GestureProdutos'));

      
    } catch (e) {
    }
  }

  Future<void> acessaPagina(int index, BuildContext context) async {
    try {
      final objetoList = listMenuInicial[index];
      switch (objetoList.gestureCommand) {
        case 'GestureVendas':
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ListaVendasPage()));
          break;
        case 'GestureEstoque':
          log("Estoque");
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const EstoqueProdutosPage()));
          break;
        case 'GestureProdutos':
          log("Produtos");
           Navigator.push(context, MaterialPageRoute(builder: (context) => const ProdutosPage()));
          break;
        default:
      }
    } catch (e) {}
  }
}
