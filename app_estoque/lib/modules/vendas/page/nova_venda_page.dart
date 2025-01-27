import 'package:app_estoque/modules/shere/widget/text_field_widget.dart';
import 'package:app_estoque/modules/vendas/controller/nova_venda_controller.dart';
import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/utils/infos_statica.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class NovaVendaPage extends StatefulWidget {
  const NovaVendaPage({super.key});

  @override
  State<NovaVendaPage> createState() => _NovaVendaPageState();
}

class _NovaVendaPageState extends MState<NovaVendaPage, NovaVendaController> {
  @override
  void initState() {
    super.registerController(NovaVendaController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      titulo: "Nova Venda",
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.04),
              child: TextWidget(
                "Vendedor",
                fontWeight: FontWeight.w600,
                fontSize: font_18,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: TextFieldWidget(
                  controller: TextEditingController(text: loggerUser.name),
                  labelExterno: "Nome",
                  titulo: "Nome",
                  textColor: preto,
                  hintText: '',
                  labelInterno: 'Insira o nome'),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: TextFieldWidget(
                  controller: TextEditingController(text: loggerUser.email),
                  titulo: "Matricula",
                  labelExterno: "Matricula",
                  textColor: preto,
                  hintText: '',
                  labelInterno: 'Insira a matricula'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.001,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: const Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  "Cliente",
                  fontWeight: FontWeight.w600,
                  fontSize: font_18,
                ),
                GestureDetector(
                    onTap: controller.selectCliente,
                    child: const Icon(Icons.add))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  bottom: MediaQuery.of(context).size.height * 0.02),
              child: TextFieldWidget(
                controller: TextEditingController(),
                titulo: "Nome",
                labelInterno: 'Insira o nome',
                labelExterno: "Nome",
                textColor: preto,
                hintText: '',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02),
              child: TextFieldWidget(
                controller: TextEditingController(),
                titulo: "CPF",
                labelExterno: "CPF",
                textColor: preto,
                hintText: '',
                labelInterno: 'Insira o CPF',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02),
              child: TextFieldWidget(
                  controller: TextEditingController(),
                  titulo: "Telefone",
                  labelExterno: "Telefone",
                  textColor: preto,
                  hintText: '',
                  labelInterno: 'Insira o Telefone'),
            ),
          ],
        ),
      ),
    );
  }
}
