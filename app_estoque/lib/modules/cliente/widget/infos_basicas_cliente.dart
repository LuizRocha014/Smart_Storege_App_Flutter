import 'package:app_estoque/modules/shere/widget/text_field_widget.dart';
import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CadastroInfosBasicasWidget extends StatelessWidget {
  const CadastroInfosBasicasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 2.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: TextFieldWidget(
            controller: TextEditingController(),
            labelExterno: "Nome",
            colorLabelExterno: CoresDoAplicativo.preto,
            labelInterno: 'Insira o nome',
            titulo: 'Nome',
            hintText: '',
          ),
        ),
        TextFieldWidget(
          controller: TextEditingController(),
          labelExterno: "CPF/CNPJ",
          colorLabelExterno: CoresDoAplicativo.preto,
          labelInterno: 'Insira o CPF/CNPJ',
          titulo: 'Nome',
          hintText: '',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: TextFieldWidget(
            controller: TextEditingController(),
            labelExterno: "E-mail",
            colorLabelExterno: CoresDoAplicativo.preto,
            labelInterno: 'Insira o Email',
            titulo: 'Nome',
            hintText: '',
          ),
        ),
        TextFieldWidget(
          controller: TextEditingController(),
          labelExterno: "Telefone",
          colorLabelExterno: CoresDoAplicativo.preto,
          labelInterno: 'Insira o Telefone',
          titulo: 'Nome',
          hintText: '',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: TextFieldWidget(
            controller: TextEditingController(),
            labelExterno: "Data de Nascimento",
            colorLabelExterno: CoresDoAplicativo.preto,
            labelInterno: 'Insira a data de nascimento',
            titulo: 'Nome',
            hintText: '',
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SmoothPageIndicator(
            controller: PageController(initialPage: 0), // PageController
            count: 2,
            axisDirection: Axis.horizontal,
            effect: WormEffect(dotHeight: 1.h, dotWidth: 1.h),
          ),
        ),
      ],
    );
  }
}
