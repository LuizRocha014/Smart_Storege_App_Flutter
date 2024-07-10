import 'package:app_estoque/modules/estoque/controller/estoque_produto_controller.dart';
import 'package:app_estoque/modules/produtos/page/cadastro_produto_page.dart';
import 'package:app_estoque/modules/produtos/widget/card_produto_widget.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstoqueProdutosPage extends StatefulWidget {
  const EstoqueProdutosPage({super.key});

  @override
  State<EstoqueProdutosPage> createState() => _EstoqueProdutosPageState();
}

class _EstoqueProdutosPageState extends State<EstoqueProdutosPage> {
  late EstoqueProdutoController controller;
  @override
  void initState() {
    controller = Get.put(EstoqueProdutoController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(const CadastroProduto()),
          backgroundColor: CoresDoAplicativo.primaryColor,
          tooltip: 'Increment Counter',
          child: const Icon(color: CoresDoAplicativo.branco, Icons.add)),
      titulo: "Estoque",
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        child: ListView.builder(
            itemCount: controller.produtosEstoque.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => CardProdutoWidget(
                  categoriaProduto: controller.produtosEstoque[index].nome,
                  quantidadeProduto: controller.produtosEstoque[index].quantidade,
                  tituloProduto: controller.produtosEstoque[index].nome,
                  nomeCampoCorCateg: 'Categoria: ',
                )),
      ),
    );
  }
}
