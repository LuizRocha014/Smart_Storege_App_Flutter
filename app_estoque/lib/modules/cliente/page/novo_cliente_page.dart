import 'package:app_estoque/modules/cliente/controller/novo_cliente_controller.dart';
import 'package:app_estoque/modules/cliente/widget/infos_basicas_cliente.dart';
import 'package:app_estoque/modules/cliente/widget/novo_cliente_endereco.dart';
import 'package:app_estoque/modules/shere/widget/button_widget.dart';
import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class NovoClientePage extends StatefulWidget {
  const NovoClientePage({super.key});

  @override
  State<NovoClientePage> createState() => _NovoClientePageState();
}

class _NovoClientePageState
    extends MState<NovoClientePage, NovoClienteControlle> {
  @override
  void initState() {
    super.registerController(NovoClienteControlle());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void goToPage(int page) {
      controller.pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return BackgroundWidget(
      titulo: "Novo Cliente",
      onBackButton: () => controller.buttonVoltar(),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    children: const [
                      CadastroInfosBasicasWidget(),
                      NovoClienteEndereco()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => ButtonWidget(
                controller.textButton,
                onPressed: () =>
                    goToPage(controller.pageController.initialPage + 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
