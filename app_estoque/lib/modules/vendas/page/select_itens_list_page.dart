import 'package:app_estoque/modules/estoque/widget/card_item_select_widget.dart';
import 'package:app_estoque/modules/shere/widget/button_widget.dart';
import 'package:app_estoque/modules/vendas/controller/select_itens_list_controller.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelecaoItensPage extends StatefulWidget {
  final String tituloPage;
  const SelecaoItensPage({super.key, required this.tituloPage});

  @override
  State<SelecaoItensPage> createState() => _SelecaoItensPageState();
}

class _SelecaoItensPageState
    extends MState<SelecaoItensPage, SelectItensController> {
  @override
  void initState() {
    super.registerController(SelectItensController());
    super.initState();
    deleteController = true;
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        titulo: widget.tituloPage,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Obx(
                () => Visibility(
                  visible: controller.listProdutos.isNotEmpty,
                  replacement: const Center(
                      child: TextWidget(
                    "Nenhum produto encontrado",
                    textColor: CoresDoAplicativo.lightGray,
                  )),
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.listProdutos.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          CardItemSelectWidget(
                        titulo: controller.listProdutos[index].nome,
                        valor: controller.listProdutos[index].valor,
                        quantidade: controller
                            .listProdutos[index].quantidadeVenda
                            .toString(),
                        onTapMore: () => controller.adicionaItemCompra(index),
                        onTapless: () => controller.removeItemCompra(index),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Obx(
                () => Visibility(
                  visible: controller.contador > 0,
                  child: ButtonWidget(
                    "(${controller.contador}) AVANÇAR",
                    onPressed: () => controller.avancaPaginaItens(),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
