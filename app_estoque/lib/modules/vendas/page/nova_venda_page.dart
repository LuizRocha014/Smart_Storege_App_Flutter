import 'package:app_estoque/modules/vendas/controller/nova_venda_controller.dart';
import 'package:app_estoque/modules/vendas/page/finalizacao_venda_page.dart';

import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/default_popup.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/utils/infos_statica.dart';
import 'package:componentes_lr/componentes_lr.dart';
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
                externalLabel: "Nome",
                textColor: preto,
                externalLabelColor: preto,
                borderColor: gray,
                enabled: false,
                labelInterno: 'Insira o nome',
                internalLabel: '',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: TextFieldWidget(
                controller: TextEditingController(text: loggerUser.email),
                externalLabel: "Matricula",
                enabled: false,
                textColor: preto,
                externalLabelColor: preto,
                borderColor: gray,
                labelInterno: 'Insira o Matricula',
                internalLabel: '',
              ),
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
                controller: controller.controllerNomeCliente,
                externalLabel: "Nome",
                internalLabel: 'Insira o nome',
                textColor: preto,
                labelInterno: '',
                enabled: controller.selecionado,
                externalLabelColor: preto,
                borderColor: gray,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02),
              child: TextFieldWidget(
                controller: controller.controlleCPFCliente,
                textColor: preto,
                externalLabel: "CPF",
                internalLabel: 'Insira o CPF',
                labelInterno: '',
                enabled: controller.selecionado,
                externalLabelColor: preto,
                borderColor: gray,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02),
              child: TextFieldWidget(
                controller: controller.controllerTelefoneCliente,
                externalLabel: "Telefone",
                textColor: preto,
                internalLabel: 'Insira o Telefone',
                labelInterno: '',
                enabled: controller.selecionado,
                externalLabelColor: preto,
                borderColor: gray,
              ),
            ),
            LoadingButtonWidget(
              title: 'PROXIMO',
              onPressed: () {
                if (controller.costumerSelected == null) {
                  return poPupErrorDefault(context, "Atenção!",
                      "É necessário selecionar um cliente para continuar com a venda");
                }
                context.push(const FinalizacaoVendaPage());
              },
              color: primaryColor,
              mostraTexto: true,
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
