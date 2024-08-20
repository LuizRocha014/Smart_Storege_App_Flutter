import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class NovoClienteControlle extends BaseController {
  final PageController pageController = PageController();
  late RxString _textButton;

  @override
  void iniciaControlador() {
    _textButton = 'PROXIMO'.obs;
  }

  String get textButton => _textButton.value;

  Future<void> buttonVoltar() async {
    if (pageController.page == 1) {
      pageController.animateToPage(
        -1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      context.pop();
    }
  }

  Future<void> proximaEtapa(int value) async {
    switch (value) {
      case 0:
        pageController.animateToPage(
          value + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 1:
        break;
      default:
    }
  }
}
