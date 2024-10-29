import 'dart:developer';

import 'package:app_estoque/base/models/smartStorege/Customer/costumer.dart';
import 'package:app_estoque/modules/cliente/page/cliente_page.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/cupertino.dart';

class NovaVendaController extends BaseController {
  late Costumer? costumerSelected;
  late TextEditingController controllerNomeCliente;
  late TextEditingController controlleCPFCliente;
  late TextEditingController controllerTelefoneCliente;
  @override
  void iniciaControlador() {
    costumerSelected = null;
    controllerNomeCliente = TextEditingController();
    controlleCPFCliente = TextEditingController();
    controllerTelefoneCliente = TextEditingController();
  }

  bool get selecionado => costumerSelected != null ? false : true;
  Future<void> selectCliente() async {
    try {
      costumerSelected = await context.push(const ClientePage(true));
      if (costumerSelected != null) {
        controllerNomeCliente.text = costumerSelected!.nome;
        controlleCPFCliente.text = costumerSelected!.cnpj;
        controllerTelefoneCliente.text = costumerSelected!.phone ?? "";
      }
    } catch (_) {}
  }
}
