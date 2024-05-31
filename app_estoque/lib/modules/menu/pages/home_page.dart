import 'package:app_estoque/modules/listaVendas/widget/card_vendas_widget.dart';
import 'package:app_estoque/utils/assets.dart';
import 'package:app_estoque/utils/backgrounds/new_background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return NewBackGroundDefault(
      widgetContainer: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.04,
                left: MediaQuery.of(context).size.height * 0.02),
            child: Row(
              children: [
                Image.asset(
                    height: MediaQuery.of(context).size.width * 0.08,
                    width: MediaQuery.of(context).size.width * 0.08,
                    AssetsAplicativo.iconApp),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02),
                  child: const TextWidget(
                    "Delivery App",
                    fontSize: FontesDoAplicativo.textMedium,
                    textColor: CoresDoAplicativo.branco,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03,
                top: MediaQuery.of(context).size.width * 0.08),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                color: CoresDoAplicativo.branco,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    top: MediaQuery.of(context).size.width * 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          "Minhas Vendas",
                          textColor: CoresDoAplicativo.lightGray,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextWidget(
                              "R 3.000.00",
                              fontSize: FontesDoAplicativo.titloText,
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.04),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: CoresDoAplicativo.lightGray),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.01),
                        ),
                        child: Image.asset(
                            height: MediaQuery.of(context).size.height * 0.01,
                            width: MediaQuery.of(context).size.width * 0.01,
                            AssetsAplicativo.iconMore),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03,
                top: MediaQuery.of(context).size.width * 0.05),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: CoresDoAplicativo
                    .secundaryColor, // Cor de fundo similar à da imagem
                hintText: 'Busque uma venda',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.qr_code_scanner),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              ),
            ),
          ),
        ],
      ),
      widget: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              "Funções",
              fontSize: FontesDoAplicativo.tituloCardVenda,
              fontWeight: FontWeight.w600,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.015),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                    width: MediaQuery.of(context).size.width * 0.01,
                    decoration: BoxDecoration(
                        color: CoresDoAplicativo.branco,
                        border:
                            Border.all(color: CoresDoAplicativo.cinzaIperClato),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsAplicativo.iconEstoque,
                          height: 40,
                        ),
                        const TextWidget("texto")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const TextWidget(
              "Vendas",
              fontSize: FontesDoAplicativo.tituloCardVenda,
              fontWeight: FontWeight.w600,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) =>
                  const CardVendasWidget(
                numVenda: "1",
                nomeVendedor: "nomeVendedor",
                dataString: "dataString",
                valorVenda: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
