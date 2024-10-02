import 'package:app_estoque/modules/shere/widget/text_field_widget.dart';
import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NovoClienteEndereco extends StatelessWidget {
  const NovoClienteEndereco({super.key});

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
            labelExterno: "CEP",
            colorLabelExterno: preto,
            labelInterno: 'Insira o CEP',
            titulo: 'Nome',
            hintText: '',
          ),
        ),
        TextFieldWidget(
          controller: TextEditingController(),
          labelExterno: "Endereço",
          colorLabelExterno: preto,
          labelInterno: 'Endereço',
          titulo: 'Nome',
          hintText: '',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: TextFieldWidget(
            controller: TextEditingController(),
            labelExterno: "Bairro",
            colorLabelExterno: preto,
            labelInterno: 'Insira o Bairro',
            titulo: 'Nome',
            hintText: '',
          ),
        ),
        TextFieldWidget(
          controller: TextEditingController(),
          labelExterno: "Ponto de Referencia",
          colorLabelExterno: preto,
          labelInterno: 'Insira o Ponto de Referencia',
          titulo: 'Nome',
          hintText: '',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: SizedBox(
            width: 50.w,
            child: TextFieldWidget(
              controller: TextEditingController(),
              labelExterno: "Número",
              colorLabelExterno: preto,
              labelInterno: 'Insira o Número',
              titulo: 'Nome',
              hintText: '',
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SmoothPageIndicator(
            controller: PageController(initialPage: 1), // PageController
            count: 2,
            axisDirection: Axis.horizontal,
            effect: WormEffect(dotHeight: 1.h, dotWidth: 1.h),
          ),
        ),
      ],
    );
  }
}
