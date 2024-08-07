import 'package:app_estoque/modules/estoque/controller/estoque_produto_controller.dart';
import 'package:app_estoque/modules/produtos/page/cadastro_produto_page.dart';
import 'package:app_estoque/modules/produtos/widget/card_produto_widget.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:app_estoque/widget/text_widget.dart';
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
  Widget build(BuildContext context) {
    return BackgroundWidget(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(const CadastroProdutoPage()),
          backgroundColor: CoresDoAplicativo.primaryColor,
          tooltip: 'Increment Counter',
          child: const Icon(color: CoresDoAplicativo.branco, Icons.add)),
      titulo: "Estoque",
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Obx(
          () => Visibility(
            visible: controller.produtosEstoque.isNotEmpty,
            replacement: const Center(
                child: TextWidget(
              "Nenhum produto encontrado",
              textColor: CoresDoAplicativo.lightGray,
            )),
            child: ListView.builder(
                itemCount: controller.produtosEstoque.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Center(
                      child: CardProdutoWidget(
                        categoriaProduto:
                            controller.produtosEstoque[index].nome,
                        quantidadeProduto:
                            controller.produtosEstoque[index].quantidade,
                        tituloProduto: controller.produtosEstoque[index].nome,
                        nomeCampoCorCateg: 'Categoria: ',
                        valorProduto: controller.produtosEstoque[index].valor,
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
