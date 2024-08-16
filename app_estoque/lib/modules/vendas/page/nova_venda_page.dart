import 'package:app_estoque/modules/shere/widget/button_widget.dart';
import 'package:app_estoque/modules/shere/widget/text_field_widget.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class NovaVendaPage extends StatelessWidget {
  const NovaVendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      titulo: "Nova Venda",
      tituloButton: "AVANÇAR",
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.04),
                  child: TextWidget(
                    "Vendedor",
                    fontWeight: FontWeight.w600,
                    fontSize: FontesDoAplicativo.tituloCardVenda,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: TextFieldWidget(
                      controller: TextEditingController(),
                      labelExterno: "Nome",
                      titulo: "Nome",
                      textColor: CoresDoAplicativo.preto,
                      hintText: '',
                      labelInterno: 'Insira o nome'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: TextFieldWidget(
                      controller: TextEditingController(),
                      titulo: "Matricula",
                      labelExterno: "Matricula",
                      textColor: CoresDoAplicativo.preto,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      "Cliente",
                      fontWeight: FontWeight.w600,
                      fontSize: FontesDoAplicativo.tituloCardVenda,
                    ),
                    const Icon(Icons.add)
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
                    textColor: CoresDoAplicativo.preto,
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
                    textColor: CoresDoAplicativo.preto,
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
                      textColor: CoresDoAplicativo.preto,
                      hintText: '',
                      labelInterno: 'Insira o Telefone'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
