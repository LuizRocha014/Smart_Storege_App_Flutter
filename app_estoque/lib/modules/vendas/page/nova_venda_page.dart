import 'package:app_estoque/modules/shere/widget/button_widget.dart';
import 'package:app_estoque/modules/shere/widget/text_field_widget.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class NovaVendaPage extends StatelessWidget {
  const NovaVendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      titulo: "Nova Venda",
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
                  child: const TextWidget(
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
                    titulo: "Vendedor",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: TextFieldWidget(
                    controller: TextEditingController(),
                    titulo: "Matricula",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.001,
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  child: const Divider(),
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      "Cliente",
                      fontWeight: FontWeight.w600,
                      fontSize: FontesDoAplicativo.tituloCardVenda,
                    ),
                    Icon(Icons.add)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: TextFieldWidget(
                    controller: TextEditingController(),
                    titulo: "Nome",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: TextFieldWidget(
                    controller: TextEditingController(),
                    titulo: "CPF",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: TextFieldWidget(
                    controller: TextEditingController(),
                    titulo: "CEP",
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: ButtonWidget("FINALIZAR"),
          )
        ],
      ),
    );
  }
}
