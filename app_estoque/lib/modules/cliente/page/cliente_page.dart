import 'package:app_estoque/modules/cliente/controller/cliente_controller.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:flutter/material.dart';

class ClientePage extends StatefulWidget {
  const ClientePage({super.key});

  @override
  State<ClientePage> createState() => _ClientePageState();
}

class _ClientePageState extends MState<ClientePage, ClienteController> {
  @override
  void initState() {
    super.registerController(ClienteController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      icon: Icons.add,
      onTap: () => controller.novoCliente(),
      titulo: "Cliente",
      child: Container(),
    );
  }
}
