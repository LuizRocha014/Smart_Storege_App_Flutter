import 'package:app_estoque/modules/estoque/controller/estoque_produto_controller.dart';
import 'package:app_estoque/modules/produtos/page/cadastro_produto_page.dart';
import 'package:app_estoque/modules/produtos/widget/card_produto_widget.dart';

import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/utils/synchronize.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstoqueProdutosPage extends StatefulWidget {
  const EstoqueProdutosPage({super.key});

  @override
  State<EstoqueProdutosPage> createState() => _EstoqueProdutosPageState();
}

class _EstoqueProdutosPageState
    extends MState<EstoqueProdutosPage, EstoqueProdutoController> {
  @override
  void initState() {
    super.registerController(EstoqueProdutoController());
    controller.context = context;
    super.initState();
  }

  @override
  void dispose() {
    instanceManager.get<Synchronism>().fullSync(forcaSincronismo: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      backgroundColor: branco,
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(const CadastroProdutoPage()),
          backgroundColor: primaryColor,
          tooltip: 'Increment Counter',
          child: const Icon(color: branco, Icons.add)),
      titulo: "Estoque",
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Obx(
          () => controller.produtosEstoque.isEmpty && !controller.isLoading
              ? const Center(
                  child: TextWidget(
                    "Nenhum produto encontrado",
                    textColor: lightGray,
                  ),
                )
              : controller.produtosEstoque.isEmpty && controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.produtosEstoque.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) => Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: TextWidget(
                                fontSize: font_16,
                                fontWeight: FontWeight.w500,
                                controller
                                    .produtosEstoque[index].categoriaName!,
                                textColor: preto,
                              ),
                            ),
                          ),
                          controller.produtosEstoque[index].listProduct!
                                  .isNotEmpty
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.produtosEstoque[index]
                                      .listProduct!.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int indexProd) =>
                                          GestureDetector(
                                    onTap: () {
                                      context.push(CadastroProdutoPage(
                                        product: controller
                                            .produtosEstoque[index]
                                            .listProduct![indexProd],
                                      ));
                                    },
                                    child: CardProdutoWidget(
                                      bytes: controller.produtosEstoque[index]
                                          .listProduct![indexProd].image!,
                                      categoriaProduto: controller
                                          .produtosEstoque[index]
                                          .listProduct![indexProd]
                                          .description,
                                      brand: controller.produtosEstoque[index]
                                          .listProduct![indexProd].brand,
                                      quantidadeProduto: controller
                                          .produtosEstoque[index]
                                          .listProduct![indexProd]
                                          .totalValue
                                          .toString(),
                                      tituloProduto: controller
                                          .produtosEstoque[index]
                                          .listProduct![indexProd]
                                          .description,
                                      valorProduto: doubleToFormattedReal(
                                          controller
                                                  .produtosEstoque[index]
                                                  .listProduct![indexProd]
                                                  .price ??
                                              0),
                                    ),
                                  ),
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: TextWidget(
                                    "Nenhum Produto encontrado",
                                    textColor: lightGray,
                                  )),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
