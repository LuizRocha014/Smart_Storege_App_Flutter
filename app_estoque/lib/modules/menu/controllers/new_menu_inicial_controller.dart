import 'dart:developer';

import 'package:app_estoque/base/models/list_menu_Iniciar.dart';
import 'package:app_estoque/modules/estoque/page/estoque_produto_page.dart';
import 'package:app_estoque/modules/listaVendas/page/lista_vendas_page.dart';
import 'package:app_estoque/modules/menu/pages/menu_principal_page.dart';
import 'package:app_estoque/modules/produtos/page/produtos_page.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewMenuIncialController extends BaseController {
 late final List<ListOpcoesMenu> listMenuInicial;

  @override
  void iniciaControlador() {
    listMenuInicial = [];
    carregaDados();
  }

  void carregaDados() {
    try {
      // listMenuInicial.add(ListOpcoesMenu(
      //     nome: 'Home',
      //     gestureCommand: 'GestureHome'));
      listMenuInicial.add(ListOpcoesMenu(
          nome: 'Vendas',
          gestureCommand: 'GestureVendas'));
      listMenuInicial.add(ListOpcoesMenu(
          nome: 'Estoque',
          gestureCommand: 'GestureEstoque'));
      listMenuInicial.add(ListOpcoesMenu(
          nome: 'Produtos',
          gestureCommand: 'GestureProdutos'));
           

      
    } catch (_) {
    }
  }

  Future<void> acessaPagina(String index, BuildContext context) async {
    try {
      
      switch (index) {
        case 'GestureVendas':
         Get.to(const ListaVendasPage());
          break;
           case 'GestureHome':
        Get.to(const MenuPrincipalPage());
          break;
        case 'GestureEstoque':
          log("Estoque");
           Get.to(const EstoqueProdutosPage());
          break;
        case 'GestureProdutos':
          log("Produtos");
            Get.to(const ProdutosPage());
          break;
        default:
      }
    } catch (_) {}
  }

  
}