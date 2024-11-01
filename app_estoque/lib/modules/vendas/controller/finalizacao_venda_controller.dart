import 'dart:developer';

import 'package:app_estoque/base/models/smartStorege/ModelSale/sale.dart';
import 'package:app_estoque/base/models/smartStorege/Transaction/transaction.dart';
import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
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
      for (var element in listProdutosSelecionados) {
        final valor = (element.numbProduct * element.salePrice!);
        valorCompra.value =
            (double.parse(valorCompra.string) + valor).toString();
      }
    } catch (_) {
      log(_.toString());
    }
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

  void createObj() {
    final sales = Sale(
        id: const Uuid().v4(),
        createdAt: DateTime.now(),
        active: true,
        valor: double.parse(valorCompra.value));
    List<Transaction> list = [];
    for (var element in listProdutosSelecionados) {
      list.add(Transaction(
          type: TipoTransacao.sale,
          productId: element.id,
          saleId: sales.id,
          userId: loggerUser.id,
          id: const Uuid().v4(),
          createdAt: DateTime.now(),
          active: true));
    }
  }
}
