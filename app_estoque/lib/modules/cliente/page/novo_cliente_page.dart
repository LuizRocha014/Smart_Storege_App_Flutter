import 'package:app_estoque/modules/cliente/controller/novo_cliente_controller.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:flutter/material.dart';

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
    return const BackgroundWidget(
      titulo: "Novo Cliente",
    );
  }
}
