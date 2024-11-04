import 'dart:math';

import 'package:app_estoque/base/models/smartStorege/Transaction/transaction.dart';
import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/models/smartStorege/venda/sale.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/isale_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/itransaction_repository.dart';
import 'package:app_estoque/modules/menu/controllers/new_menu_inicial_controller.dart';
import 'package:app_estoque/modules/menu/pages/home_page.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/modules/vendas/controller/nova_venda_controller.dart';
import 'package:app_estoque/modules/vendas/controller/select_itens_list_controller.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/enuns.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/utils/infos_statica.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:uuid/uuid.dart';

class FinalizacaoVendaController extends BaseController {
  late RxList<Product> listProdutosSelecionados;
  late RxString valorCompra;
  late TextEditingController valorDesconto;
  @override
  void iniciaControlador() {
    valorCompra = RxString("0");
    valorDesconto = TextEditingController(text: "");
    final controller = instanceManager.get<SelectItensController>();
    listProdutosSelecionados = RxList(controller.itemSelecionado);
    calculaValoCompra();
  }

  void adicionaItemCompra(int index) {
    try {
      final item = listProdutosSelecionados[index];
      item.numbProduct++;
      calculaValoCompra();
      listProdutosSelecionados.refresh();
    } catch (_) {}
  }

  void removeItemCompra(int index) {
    try {
      final item = listProdutosSelecionados[index];
      if (item.numbProduct > 0) {
        item.numbProduct--;
      }
      calculaValoCompra();
      listProdutosSelecionados.refresh();
    } catch (_) {}
  }

  void calculaValoCompra() {
    try {
      valorCompra.value = "0";
      for (var element in listProdutosSelecionados) {
        final valor = (element.numbProduct * element.salePrice!);
        valorCompra.value =
            (double.parse(valorCompra.string) + valor).toString();
      }
      valorCompra.refresh();
    } catch (_) {}
  }

  void inserirDesconto() {
    showModalBottomSheet(
      // ignore: use_build_context_synchronously
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
            color: branco,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2.h), topRight: Radius.circular(2.h))),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.025),
                child: TextWidget(
                  "Insira o desconto desejado",
                  fontSize: font_18,
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: TextFieldWidget(
                      controller: valorDesconto,
                      internalLabel: "Insira o desconto",
                      externalLabel: "Desconto",
                      borderColor: gray,
                      keyboardType: TextInputType.number,
                      externalLabelColor: preto,
                      labelInterno: "Insira o desconto")),
              const Spacer(),
              ButtonWidget(
                onPressed: () => Navigator.pop(context),
                borderRadius: 2.h,
                title: "SALVAR",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createObj() async {
    final sales = Sale(
        id: const Uuid().v4(),
        sync: false,
        createdAt: DateTime.now(),
        codigoVenda: gerarCodigoRandomico(),
        active: true,
        desconto: double.tryParse(valorDesconto.text),
        valor: double.parse(valorCompra.value));
    List<Transaction> list = [];
    for (var element in listProdutosSelecionados) {
      list.add(Transaction(
          type: TipoTransacao.sale,
          sync: false,
          customerId:
              instanceManager.get<NovaVendaController>().costumerSelected?.id,
          productId: element.id,
          numberProd: element.numbProduct,
          saleId: sales.id,
          originCompanyId: shopUser.shopId,
          userId: loggerUser.id,
          id: const Uuid().v4(),
          createdAt: DateTime.now(),
          active: true));
    }
    await instanceManager
        .get<ISaleRepository>()
        .createOrReplace(sales.toJson());
    await instanceManager
        .get<ITransactionRepository>()
        .createList(list.map((e) => e.toJson()));
    instanceManager.get<NewMenuIncialController>().carregaValorVendas();
    // ignore: use_build_context_synchronously
    context.pushAndRemoveUntil(const HomePage());
  }

  String gerarCodigoRandomico() {
    const caracteres =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();

    return List.generate(
        8, (index) => caracteres[random.nextInt(caracteres.length)]).join();
  }
}
