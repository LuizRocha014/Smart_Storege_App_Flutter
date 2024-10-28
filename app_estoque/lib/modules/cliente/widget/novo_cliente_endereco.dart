import 'package:app_estoque/modules/cliente/controller/novo_cliente_controller.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NovoClienteEndereco extends StatelessWidget {
  final NovoClienteControlle controller;
  const NovoClienteEndereco(this.controller, {super.key});

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
            controller: controller.controllerCep,
            externalLabel: "CEP",
            externalLabelColor: preto,
            borderColor: gray,
            internalLabel: 'Insira o CEP',
            labelInterno: '',
            inputFormatters: [CepInputFormatter()],
          ),
        ),
        TextFieldWidget(
          controller: controller.controllerEndereco,
          externalLabel: "Endereço",
          externalLabelColor: preto,
          borderColor: gray,
          internalLabel: 'Endereço',
          labelInterno: '',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: TextFieldWidget(
            controller: controller.controllerBairro,
            externalLabel: "Bairro",
            externalLabelColor: preto,
            borderColor: gray,
            internalLabel: 'Insira o Bairro',
            labelInterno: '',
          ),
        ),
        TextFieldWidget(
          controller: controller.controllerPontoReferencia,
          externalLabel: "Ponto de Referencia",
          externalLabelColor: preto,
          borderColor: gray,
          internalLabel: 'Insira o Ponto de Referencia',
          labelInterno: '',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: SizedBox(
            width: 50.w,
            child: TextFieldWidget(
              controller: controller.controlleraddressNumber,
              externalLabel: "Número",
              externalLabelColor: preto,
              borderColor: gray,
              internalLabel: 'Insira o Número',
              labelInterno: '',
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
