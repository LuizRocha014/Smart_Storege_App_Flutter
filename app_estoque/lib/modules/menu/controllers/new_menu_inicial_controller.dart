import 'dart:convert';
import 'dart:developer';

import 'package:app_estoque/base/models/acesso/acesso.dart';
import 'package:app_estoque/base/models/list_menu_Iniciar.dart';
import 'package:app_estoque/modules/estoque/page/estoque_produto_page.dart';
import 'package:app_estoque/modules/listaVendas/page/lista_vendas_page.dart';
import 'package:app_estoque/modules/login/controllers/login_controller.dart';
import 'package:app_estoque/modules/menu/pages/menu_principal_page.dart';
import 'package:app_estoque/modules/produtos/page/produtos_page.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewMenuIncialController extends BaseController {
  late final RxList<ListOpcoesMenu> listMenuInicial;

  @override
  Future<void> iniciaControlador() async {
    listMenuInicial = RxList<ListOpcoesMenu>();
    await carregaDados();
  }
List<ListOpcoesMenu> get listOpcaoMenu  => listMenuInicial;
  Future<void> carregaDados() async {
    try {
      final controllerLogin = Get.put(LoginController());
      final uri = Uri.http(url, "api/Acesso/GetAcessos",
          {'userId': controllerLogin.usuarioLogin.id});

      final retonro = await http.get(uri);
      if (retonro.body.isEmpty) throw Exception();
      final List<Acessos> acessos =
          (jsonDecode(retonro.body) as List<dynamic>).map((e) => Acessos.fromJson(e)).toList();

      for (var acesso in acessos) {
        switch (acesso.valor) {
          case "AcessVenderProd":
            break;
          case "listaDeVandasAcess":
            listMenuInicial.add(ListOpcoesMenu(
                nome: 'Vendas', gestureCommand: 'GestureVendas'));
            break;
          case "AcessVenda":
            break;
          case "AcessEstoque":
            listMenuInicial.add(ListOpcoesMenu(
                nome: 'Estoque', gestureCommand: 'GestureEstoque'));
            break;
          case "AcessProdutos":
            listMenuInicial.add(ListOpcoesMenu(
                nome: 'Produtos', gestureCommand: 'GestureProdutos'));
            break;
             case "AcessTransLoja":
            listMenuInicial.add(ListOpcoesMenu(
                nome: 'Transferencia', gestureCommand: 'GestureTransferencia'));
            break;
          default:
        }
      }
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
          Get.to(const ProdutosPage());
          break;
        default:
      }
    } catch (_) {}
  }
}
