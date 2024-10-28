import 'dart:developer';

import 'package:app_estoque/modules/listaVendas/widget/card_vendas_widget.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';

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
              textColor: textGray,
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.05),
            child: Container(
              height: 1,
              decoration: const BoxDecoration(color: lightGray),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.02),
            child: ListView.builder(
              itemCount: 15,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  log("Teste");
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height * 0.025),
                            child: TextWidget(
                              "Aviso!",
                              fontSize: font_18,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: const TextWidget(
                                "Login ou senha incorretos, tente novamente!"),
                          ),
                          const Spacer(),
                          ButtonWidget(
                            onPressed: () => Navigator.pop(context),
                            title:  "ENTENDI",
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const CardVendasWidget(
                    numVenda: "VENDA N° 225",
                    nomeVendedor: "Osvaldo Cruz",
                    dataString: "12/04/2024",
                    valorVenda: 200),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
