import 'package:app_estoque/modules/cliente/controller/novo_cliente_controller.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CadastroInfosBasicasWidget extends StatelessWidget {
  final NovoClienteControlle controller;
  const CadastroInfosBasicasWidget(this.controller, {super.key});

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
            controller: controller.controllerNome,
            externalLabel: "Nome",
            internalLabel: 'Insira o nome',
            labelInterno: '',
            externalLabelColor: preto,
            borderColor: gray,
          ),
        ),
        TextFieldWidget(
          controller: controller.controllerCnpjCpf,
          externalLabel: "CNPJ",
          externalLabelColor: preto,
          borderColor: gray,
          inputFormatters: [MaskCpfCnpj(true)],
          internalLabel: 'Insira o CPF/CNPJ',
          labelInterno: '',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: TextFieldWidget(
            controller: controller.controllerEmail,
            externalLabel: "E-mail",
            externalLabelColor: preto,
            borderColor: gray,
            validator: validacaoEmail,
            internalLabel: 'Insira o Email',
            labelInterno: '',
          ),
        ),
        TextFieldWidget(
          controller: controller.controllerTelefone,
          externalLabel: "Telefone",
          externalLabelColor: preto,
          borderColor: gray,
          inputFormatters: [PhoneNumberMask(true)],
          internalLabel: 'Insira o Telefone',
          labelInterno: '',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: TextFieldWidget(
            controller: controller.controllerDataNascimento,
            externalLabel: "Data de Nascimento",
            externalLabelColor: preto,
            borderColor: gray,
            inputFormatters: [DateFormatter()],
            validator: validacaoData,
            internalLabel: 'Insira a data de nascimento',
            labelInterno: '',
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
