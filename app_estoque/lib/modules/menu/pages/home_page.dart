import 'dart:developer';

import 'package:app_estoque/modules/menu/controllers/new_menu_inicial_controller.dart';
import 'package:app_estoque/modules/vendas/page/select_itens_list_page.dart';
import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/assets.dart';
import 'package:app_estoque/utils/backgrounds/new_background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/utils/routes.dart';
import 'package:app_estoque/widget/rich_text_widet.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NewMenuIncialController controller;

  @override
  void initState() {
    controller = Get.put(NewMenuIncialController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NewBackGroundDefault(
      widgetContainer: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                  height: MediaQuery.of(context).size.width * 0.08,
                  width: MediaQuery.of(context).size.width * 0.08,
                  AssetsAplicativo.iconApp),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.02),
                child: TextWidget(
                  "Delivery App",
                  fontSize: FontesDoAplicativo.textMedium,
                  textColor: CoresDoAplicativo.branco,
                ),
              ),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.08),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextWidget(
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
                      child: GestureDetector(
                        onTap: () => context.push(const SelecaoItensPage(
                          tituloPage: "Produtos",
                        )),
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
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: CoresDoAplicativo.secundaryColor
                    .withOpacity(0.9), // Cor de fundo similar à da imagem
                hintText: 'Busque uma venda',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: GestureDetector(
                    onTap: () {
                      log("Scan");
                    },
                    child: const Icon(Icons.qr_code_scanner)),
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
            TextWidget(
              "Funções",
              fontSize: FontesDoAplicativo.tituloCardVenda,
              fontWeight: FontWeight.w600,
            ),
            Obx(
              () => Visibility(
                visible: controller.listOpcaoMenu.isNotEmpty,
                replacement: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: const Align(
                    alignment: Alignment.center,
                    child: TextWidget(
                      "Nenhum acesso encontrado",
                      textColor: CoresDoAplicativo.cinzaIperClato,
                    ),
                  ),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: controller.listMenuInicial.length,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () => controller.acessaPagina(
                        controller.listMenuInicial[index].gestureCommand,
                        context),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.015),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                        width: MediaQuery.of(context).size.width * 0.01,
                        decoration: BoxDecoration(
                            color: CoresDoAplicativo.branco,
                            border: Border.all(
                                color: CoresDoAplicativo.cinzaIperClato),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              controller.listMenuInicial[index].imageString,
                              height: 40,
                            ),
                            TextWidget(controller.listMenuInicial[index].nome)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  "Vendas",
                  fontSize: FontesDoAplicativo.tituloCardVenda,
                  fontWeight: FontWeight.w600,
                ),
                const TextWidget("Ver tudo",
                    textColor: CoresDoAplicativo.cinzaIperClato)
              ],
            ),
            Visibility(
              visible: false,
              replacement: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: const Center(
                    child: TextWidget(
                  "Nenhuma venda encontrado",
                  textColor: CoresDoAplicativo.lightGray,
                )),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    decoration: BoxDecoration(
                        color: CoresDoAplicativo.branco,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.015),
                        border: Border.all(
                            color: CoresDoAplicativo.cinzaIperClato)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: CoresDoAplicativo.secundaryColor,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.height * 0.01),
                              border: Border.all(
                                  color: CoresDoAplicativo.secundaryColor),
                            ),
                            child: Image.asset(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                AssetsAplicativo.iconItemProduto),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                "MM234689",
                                fontWeight: FontWeight.w500,
                                fontSize: FontesDoAplicativo.textCardVenda,
                              ),
                              const CustomRich("Cliente: ", "516.219.828.58"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
