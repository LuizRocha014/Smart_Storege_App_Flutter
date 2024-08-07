import 'dart:developer';

import 'package:app_estoque/base/models/dto/list_menu_Iniciar.dart';
import 'package:app_estoque/base/service/interface/iuser_service.dart';
import 'package:app_estoque/modules/estoque/page/estoque_produto_page.dart';
import 'package:app_estoque/modules/listaVendas/page/lista_vendas_page.dart';
import 'package:app_estoque/modules/menu/pages/menu_principal_page.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/modules/vendas/page/select_itens_list_page.dart';
import 'package:app_estoque/utils/assets.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewMenuIncialController extends BaseController {
  late final RxList<ListOpcoesMenu> listMenuInicial;

  @override
  Future<void> iniciaControlador() async {
    listMenuInicial = RxList<ListOpcoesMenu>();
    await carregaDados();
  }

  List<ListOpcoesMenu> get listOpcaoMenu => listMenuInicial;
  Future<void> carregaDados() async {
    try {
      final acessos = await instanceManager.get<IUserService>().buscaAcessos();

      for (var acesso in acessos) {
        switch (acesso!.valor) {
          case "AcessEstoque":
            listMenuInicial.add(ListOpcoesMenu(
                nome: 'Estoque',
                gestureCommand: 'GestureEstoque',
                imageString: AssetsAplicativo.iconEstoque));
            break;
          case "AcessProdutos":
            listMenuInicial.add(ListOpcoesMenu(
                nome: 'Produtos',
                gestureCommand: 'GestureProdutos',
                imageString: AssetsAplicativo.iconProdutos));
            break;
          case "AcessTransLoja":
            listMenuInicial.add(ListOpcoesMenu(
                nome: 'Transferencia',
                gestureCommand: 'GestureTransferencia',
                imageString: AssetsAplicativo.iconTransferencia));
            break;
          default:
        }
      }
      listMenuInicial.add(ListOpcoesMenu(
          nome: 'Outros',
          gestureCommand: 'GestureOutros',
          imageString: AssetsAplicativo.iconMoreMenu));
    } catch (_) {}
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
          Get.to(const SelecaoItensPage(
            tituloPage: "Produtos",
          ));
          break;
        default:
      }
    } catch (_) {}
  }
}
