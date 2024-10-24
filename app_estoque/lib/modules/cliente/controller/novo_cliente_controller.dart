import 'package:app_estoque/base/models/smartStorege/Customer/costumer.dart';
import 'package:app_estoque/base/models/smartStorege/shopCustomer/shop_costumer.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icostumer_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_costumer_repository.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/infos_statica.dart';
import 'package:app_estoque/utils/routes.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:uuid/uuid.dart';

class NovoClienteControlle extends BaseController {
  final PageController pageController = PageController();
  late RxString _textButton;
  late TextEditingController controllerNome;
  late TextEditingController controllerCnpjCpf;
  late TextEditingController controllerEmail;
  late TextEditingController controllerTelefone;
  late TextEditingController controllerDataNascimento;
  late TextEditingController controllerCep;
  late TextEditingController controllerEndereco;
  late TextEditingController controllerBairro;
  late TextEditingController controllerPontoReferencia;
  late TextEditingController controlleraddressNumber;
  @override
  void iniciaControlador() {
    _textButton = 'PROXIMO'.obs;
    controllerNome = TextEditingController();
    controllerCnpjCpf = TextEditingController();
    controllerEmail = TextEditingController();
    controllerTelefone = TextEditingController();
    controllerDataNascimento = TextEditingController();
    controllerCep = TextEditingController();
    controllerEndereco = TextEditingController();
    controllerBairro = TextEditingController();
    controllerPontoReferencia = TextEditingController();
    controlleraddressNumber = TextEditingController();
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
        await createObj();
        break;
      default:
    }
  }

  void goToPage(int page) {
    if (page == 2) {
      proximaEtapa(page);
    }
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> createObj() async {
    try {
      final clienteId = const Uuid().v4();
      final cliente = Costumer(
          id: clienteId,
          nome: controllerNome.text,
          cnpj: controllerCnpjCpf.text,
          email: controllerEmail.text,
          addressNumber: controlleraddressNumber.text,
          address: controllerEndereco.text,
          zipCode: controllerCep.text,
          createdAt: DateTime.now(),
          active: true);
      final shopCostumer = ShopCostumer(
          id: const Uuid().v4(),
          createdAt: DateTime.now(),
          active: true,
          costumerId: clienteId,
          shopId: shopUser.shopId);

      await instanceManager
          .get<ICostumerRepository>()
          .createOrReplace(cliente.toJson());
      await instanceManager
          .get<IShopCostumerRepository>()
          .createOrReplace(shopCostumer.toJson());
    } catch (_) {}
  }
}
