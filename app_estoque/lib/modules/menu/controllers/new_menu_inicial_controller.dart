import 'dart:developer';

import 'package:app_estoque/base/models/dto/list_menu_Iniciar.dart';
import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iuser_permission_repository.dart';
import 'package:app_estoque/modules/cliente/page/cliente_page.dart';
import 'package:app_estoque/modules/estoque/page/estoque_produto_page.dart';
import 'package:app_estoque/modules/listaVendas/page/lista_vendas_page.dart';
import 'package:app_estoque/modules/menu/pages/menu_principal_page.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/modules/vendas/page/select_itens_list_page.dart';
import 'package:app_estoque/utils/assets.dart';
import 'package:app_estoque/utils/routes.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewMenuIncialController extends BaseController {
  late final RxList<ListOpcoesMenu> listMenuInicial;
  late final RxList<Product> listProduto;

  @override
  Future<void> iniciaControlador() async {
    listMenuInicial = RxList<ListOpcoesMenu>();
    listProduto = RxList<Product>();
    await carregaDados();
  }

  List<ListOpcoesMenu> get listOpcaoMenu => listMenuInicial;
  Future<void> carregaDados() async {
    try {
      final listUsuarioAcesso = await instanceManager
          .get<IUserPermissionRepository>()
          .getPermissionUser();

      switch (listUsuarioAcesso) {
        default:
      }
      listMenuInicial.add(ListOpcoesMenu(
          nome: 'Estoque',
          gestureCommand: 'GestureEstoque',
          imageString: iconEstoque));
      listMenuInicial.add(ListOpcoesMenu(
          nome: 'Produtos',
          gestureCommand: 'GestureProdutos',
          imageString: iconProdutos));
      listMenuInicial.add(ListOpcoesMenu(
          nome: 'Transferencia',
          gestureCommand: 'GestureTransferencia',
          imageString: iconTransferencia));
      listMenuInicial.add(ListOpcoesMenu(
          nome: 'Cliente',
          gestureCommand: 'GestureCliente',
          imageString: iconCliente));
      listMenuInicial.add(ListOpcoesMenu(
          nome: 'Outros',
          gestureCommand: 'GestureOutros',
          imageString: iconMoreMenu));
    } catch (_) {}
  }

  Future<void> acessaPagina(String index, BuildContext context) async {
    try {
      switch (index) {
        case 'GestureVendas':
          context.push(const ListaVendasPage());
          break;
        case 'GestureHome':
          context.push(const MenuPrincipalPage());
          break;
        case 'GestureEstoque':
          log("Estoque");
          context.push(const EstoqueProdutosPage());
          break;
        case 'GestureProdutos':
          log("Produtos");
          context.push(const SelecaoItensPage(
            tituloPage: "Produtos",
          ));
          break;
        case 'GestureCliente':
          context.push(const ClientePage());
          break;
        default:
      }
    } catch (_) {}
  }
}
