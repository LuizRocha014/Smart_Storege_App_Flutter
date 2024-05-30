import 'package:app_estoque/modules/shere/widget/text_field_widget.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroProduto extends StatelessWidget {
  const CadastroProduto({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      titulo: "Cadastro de Produto",
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.04,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.04),
              child: TextFieldWidget(
                controller: TextEditingController(),
                titulo: "Nome",
                hintText: "Digite o nome do produto",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.04),
              child: TextFieldWidget(
                controller: TextEditingController(),
                titulo: "Marca",
                hintText: "Digite a marca do produto",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldWidget(
                    widthLargura: MediaQuery.of(context).size.width * 0.5,
                    controller: TextEditingController(),
                    titulo: "Nome",
                    hintText: "Digite a cor",
                  ),
                  TextFieldWidget(
                    widthLargura: MediaQuery.of(context).size.width * 0.3,
                    controller: TextEditingController(),
                    titulo: "Quantidade",
                    hintText: "Qnt",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
