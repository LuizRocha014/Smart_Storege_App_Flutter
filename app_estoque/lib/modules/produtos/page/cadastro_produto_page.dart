import 'package:app_estoque/modules/produtos/controller/cadastro_produto_controller.dart';
import 'package:app_estoque/modules/shere/widget/button_widget.dart';
import 'package:app_estoque/modules/shere/widget/text_field_widget.dart';
import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/widget/dropdown_widget.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CadastroProduto extends StatefulWidget {
  const CadastroProduto({super.key});

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  late CadastroProdutoController controller;
  @override
  void initState() {
    controller = Get.put(CadastroProdutoController());
    super.initState();
  }

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
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: CoresDoAplicativo.gray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Obx(() => Visibility(
                      visible: controller.mostraImagem.value,
                      child: Image.file(
                        controller.imagem!,
                        fit: BoxFit.fill,
                      ))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03,
                      vertical: MediaQuery.of(context).size.width * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
                        child: GestureDetector(
                          onTap: () => controller.tiraFoto(ImageSource.camera),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.30,
                            decoration: const BoxDecoration(
                              color: CoresDoAplicativo.brancoFumaca,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: TextWidget("Nova Foto"),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.30,
                        decoration: const BoxDecoration(
                          color: CoresDoAplicativo.brancoFumaca,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const Center(
                          child: TextWidget("Novo Código"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
              child: TextFieldWidget(
                controller: controller.nomeController,
                titulo: "Nome",
                labelExterno: "Nome",
                labelInterno: 'Digite o nome do produto',
                color: CoresDoAplicativo.branco,
                textColor: CoresDoAplicativo.preto,
                hintText: '',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
              child: TextFieldWidget(
                labelExterno: "Marca",
                controller: controller.marcaController,
                titulo: "Marca",
                labelInterno: 'Digite o marca do produto',
                color: CoresDoAplicativo.branco,
                textColor: CoresDoAplicativo.preto,
                hintText: '',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h, left: 1.w, right: 1.w),
              child: DropDownWidget(
                borderColor: CoresDoAplicativo.gray,
                hintText: "Text",
                label: 'Categoria',
                onChanged: (value) {},
                itens: controller.drop.map((e) => DropdownItem(id: "", texto: e)).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFieldWidget(
                      titulo: "Cor",
                      labelExterno: "Cor",
                      hintText: "Selecione a cor",
                      controller: controller.corController,
                      labelInterno: 'Selecione a cor',
                      color: CoresDoAplicativo.branco,
                      textColor: CoresDoAplicativo.preto,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFieldWidget(
                      labelExterno: "Quantidade",
                      titulo: "Quantidade",
                      controller: controller.quantController,
                      labelInterno: 'Digite a qnt',
                      color: CoresDoAplicativo.branco,
                      textColor: CoresDoAplicativo.preto,
                      hintText: '',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
              child: TextFieldWidget(
                labelExterno: "Valor",
                controller: controller.valorController,
                hintText: "Digite o valor do produto",
                titulo: "Valor",
                labelInterno: 'Digite a qnt',
                color: CoresDoAplicativo.branco,
                textColor: CoresDoAplicativo.preto,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWidget(
                "SALVAR",
                onPressed: () => controller.cadastroProduto(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
