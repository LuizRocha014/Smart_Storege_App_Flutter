import 'package:app_estoque/modules/login/controllers/menu_principal_controller.dart';
import 'package:app_estoque/modules/login/widget/card_opcoes_menu_widget.dart';
import 'package:app_estoque/utils/assets.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPrincipalPage extends StatefulWidget {
  const MenuPrincipalPage({super.key});

  @override
  State<MenuPrincipalPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<MenuPrincipalPage> {
  late final MenuPrincipalController controller;
  @override
  void initState() {
    controller = Get.put(MenuPrincipalController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPrincipal(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: CoresDoAplicativo.primaryColor,
        tooltip: 'Increment Counter',
        child: Image.asset(
          AssetsAplicativo.iconAdicionarVenda,
          height: 30,
        ),
      ),
      enableBackButton: false,
      titulo: 'Home',
      childSecund: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: controller.listMenuInicial.length,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                      onTap: () => controller.acessaPagina(index, context),
                      child: CardListMenuPrincipalWidget(
                          tituloCard: controller.listMenuInicial[index].nome,
                          imageAssets: controller.listMenuInicial[index].image),
                    )),
          ],
        ),
      ),
    );
  }
}
