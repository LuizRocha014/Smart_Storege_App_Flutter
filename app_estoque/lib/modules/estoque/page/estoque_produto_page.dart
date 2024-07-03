import 'package:app_estoque/modules/produtos/page/cadastro_produto_page.dart';
import 'package:app_estoque/modules/produtos/widget/card_produto_widget.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstoqueProdutosPage extends StatelessWidget {
  const EstoqueProdutosPage({super.key});

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
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => const CardProdutoWidget(
                  categoriaProduto: 'Diversos',
                  quantidadeProduto: '10',
                  tituloProduto: 'Abobora com carne',
                  nomeCampoCorCateg: 'Categoria: ',
                )),
      ),
    );
  }
}
