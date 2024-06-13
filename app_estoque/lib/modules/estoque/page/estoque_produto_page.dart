import 'package:app_estoque/modules/produtos/widget/card_produto_widget.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EstoqueProdutosPage extends StatelessWidget {
  const EstoqueProdutosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      titulo: "Estoque",
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) =>
                const CardProdutoWidget(
                  categoriaProduto: 'Diversos',
                  quantidadeProduto: '10',
                  tituloProduto: 'Abobora com carne',
                  nomeCampoCorCateg: 'Categoria: ',
                )),
      ),
    );
  }
}
