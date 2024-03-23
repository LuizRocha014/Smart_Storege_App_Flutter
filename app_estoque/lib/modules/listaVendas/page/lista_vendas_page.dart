import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/conversores.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/rich_text_widet.dart';
import 'package:app_estoque/widget/text_widget.dart';
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
    return BackgroundPrincipal(
      titulo: "Lista de Vendas",
      enableBackButton: true,
      childSecund: Column(
        children: [
          const TextWidget(
            "VENDAS",
            textColor: CoresDoAplicativo.textGray,
            fontSize: 28,
            fontWeight: FontWeight.w500,
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
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: CoresDoAplicativo.lightGray),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              "VENDA N°224",
                              fontSize: FontesDoAplicativo.tituloCardVenda,
                              textColor: CoresDoAplicativo.textGray,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: CoresDoAplicativo.lightGray,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Container(
                          color: CoresDoAplicativo.lightGray,
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // const TextWidget(
                        //   "Vendedor:",
                        //   fontSize: FontesDoAplicativo.textCardVenda,
                        //   textColor: CoresDoAplicativo.textGray,
                        // ),
                        const CustomRich("Vendedor: ","Mario Gonzaga"),
                        const CustomRich("Data: ","12/04/2024"),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(
                                "Total",
                                fontWeight: FontWeight.bold,
                                fontSize: FontesDoAplicativo.textMedium,
                              ),
                              const Spacer(),
                              TextWidget(
                                Conversores.formatarValorEmReal(12),
                                fontWeight: FontWeight.bold,
                                fontSize: FontesDoAplicativo.textMedium,
                              ),
                            ],
                          ),
                        )
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
