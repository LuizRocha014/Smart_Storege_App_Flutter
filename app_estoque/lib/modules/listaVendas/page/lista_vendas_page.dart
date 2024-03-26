import 'package:app_estoque/modules/listaVendas/widget/card_vendas_widget.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListaVendasPage extends StatefulWidget {
  const ListaVendasPage({super.key});

  @override
  State<ListaVendasPage> createState() => _ListaVendasPageState();
}

class _ListaVendasPageState extends State<ListaVendasPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      titulo: "Lista de Vendas",
      child: ListView(
        children: [
          const Center(
            child: TextWidget(
              "VENDAS",
              textColor: CoresDoAplicativo.textGray,
              fontSize: 28,
              fontWeight: FontWeight.w500,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: 15,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) =>
                  const CardVendasWidget(
                      numVenda: "VENDA N° 225",
                      nomeVendedor: "Osvaldo Cruz",
                      dataString: "12/04/2024",
                      valorVenda: 200),
            ),
          )
        ],
      ),
    );
  }
}
