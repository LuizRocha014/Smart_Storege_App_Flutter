import 'dart:developer';

import 'package:app_estoque/modules/listaVendas/widget/card_vendas_widget.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/background_menu_widget.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class NewMenuInicialPage extends StatefulWidget {
  const NewMenuInicialPage({super.key});

  @override
  State<NewMenuInicialPage> createState() => _NewMenuInicialPageState();
}

class _NewMenuInicialPageState extends State<NewMenuInicialPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundMenuWidget(
      floatingActionButton: FloatingActionButton(onPressed: () {log("Add new Soled");},),
      body: ListView(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: TextWidget(
                "VENDAS",
                fontWeight: FontWeight.w500,
                fontSize: FontesDoAplicativo.titloText,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: 15,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
