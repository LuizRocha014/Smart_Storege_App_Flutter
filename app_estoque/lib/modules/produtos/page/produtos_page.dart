import 'package:app_estoque/modules/produtos/controller/produto_controller.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProdutosPage> {
  late ProdutoController controller;
  @override
  void initState() {
    controller = Get.put(ProdutoController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      titulo: "Produtos",
      child: ListView(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextWidget(
                "PRODUTOS",
                textColor: CoresDoAplicativo.textGray,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 1,
              decoration: const BoxDecoration(color: CoresDoAplicativo.lightGray),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Obx(
              () => ListView.builder(
                itemCount: controller.produtos.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
                    decoration: BoxDecoration(
                      color: CoresDoAplicativo.branco,
                      border: Border.all(color: CoresDoAplicativo.gray),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), color: CoresDoAplicativo.primaryColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.02,
                              top: MediaQuery.of(context).size.height * 0.01),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                controller.produtos[index].nome,
                                fontSize: FontesDoAplicativo.textMedium,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.width * 0.05,
                              ),
                              TextWidget(
                                controller.produtos[index].quantidade,
                                fontSize: FontesDoAplicativo.textValorProduto,
                                textColor: CoresDoAplicativo.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
