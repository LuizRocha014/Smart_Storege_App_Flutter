import 'package:app_estoque/modules/produtos/widget/card_produto_widget.dart';
import 'package:app_estoque/modules/shere/widget/button_widget.dart';
import 'package:app_estoque/modules/vendas/controller/select_itens_list_controller.dart';
import 'package:app_estoque/modules/vendas/page/nova_venda_page.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelecaoItensPage extends StatefulWidget {
  final String tituloPage;
  const SelecaoItensPage({super.key, required this.tituloPage});

  @override
  State<SelecaoItensPage> createState() => _SelecaoItensPageState();
}

class _SelecaoItensPageState extends State<SelecaoItensPage> {
  late SelectItensController controller;
  @override
  void initState() {
    controller = Get.put(SelectItensController());
    super.initState();
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
                () => ListView.builder(
                  itemCount: controller.listProdutos.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () {},
                    child: CardProdutoWidget(
                      categoriaProduto: controller.listProdutos[index].marca,
                      quantidadeProduto:
                          controller.listProdutos[index].quantidade,
                      tituloProduto: controller.listProdutos[index].nome,
                      valorProduto: controller.listProdutos[index].valor,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWidget(
                "AVANÇAR",
                onPressed: () => Get.to(const NovaVendaPage()),
              ),
            ),
          ],
        ));
  }
}
