import 'package:app_estoque/modules/produtos/widget/card_produto_widget.dart';
import 'package:app_estoque/modules/shere/widget/button_widget.dart';
import 'package:app_estoque/modules/vendas/controller/select_itens_list_controller.dart';
import 'package:app_estoque/modules/vendas/page/nova_venda_page.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelecaoItensPage extends StatefulWidget {
  const SelecaoItensPage({super.key});

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
        titulo: "Estoque",
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {},
                  child: const CardProdutoWidget(
                    categoriaProduto: 'Diversos',
                    quantidadeProduto: '10',
                    tituloProduto: 'Abobora com carne',
                    nomeCampoCorCateg: 'Categoria: ',
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
