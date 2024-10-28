import 'package:app_estoque/modules/login/page/login_page.dart';
import 'package:app_estoque/modules/menu/controllers/new_menu_inicial_controller.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundMenuWidget extends StatefulWidget {
  final Widget? body;
  final Widget? floatingActionButton;
  const BackgroundMenuWidget({super.key, this.body, this.floatingActionButton});

  @override
  State<BackgroundMenuWidget> createState() => _BackgroundMenuWidgetState();
}

class _BackgroundMenuWidgetState extends State<BackgroundMenuWidget> {
  late final NewMenuIncialController _controller;
  @override
  @override
  void initState() {
    super.initState();
    _controller = Get.put(NewMenuIncialController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.floatingActionButton,
      backgroundColor: branco,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: branco),
        title: const TextWidget(
          "",
          textColor: branco,
        ),
        backgroundColor: primaryColor,
      ),
      drawer: Drawer(
        backgroundColor: branco,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 170,
              width: 400,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: const Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextWidget(
                      "MENU",
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      textColor: branco,
                    ),
                  )),
            ),
            Obx(
              () => ListView.builder(
                itemCount: _controller.listOpcaoMenu.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => _controller.acessaPagina(
                          _controller.listOpcaoMenu[index].gestureCommand,
                          context),
                      child: TextWidget(
                        _controller.listOpcaoMenu[index].nome,
                        fontSize: font_16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
                onTap: () => Get.offAll(const LoginPage()),
                child: const TextWidget("SAIR")),
          ],
        ),
      ),
      body: widget.body,
    );
  }
}
