import 'package:app_estoque/modules/produtos/page/cadastro_produto_page.dart';
import 'package:app_estoque/modules/produtos/widget/card_produto_widget.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProdutosPage> {
  @override
  void initState() {
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
              decoration:
                  const BoxDecoration(color: CoresDoAplicativo.lightGray),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    const CardProdutoWidget(
                      categoriaProduto: 'Diversos',
                      quantidadeProduto: '10',
                      tituloProduto: 'Abobora com carne',
                      nomeCampoCorCateg: 'Categoria: ',
                    )),
          )
        ],
      ),
    );
  }
}
