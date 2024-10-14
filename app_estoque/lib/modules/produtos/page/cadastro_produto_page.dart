import 'package:app_estoque/modules/produtos/controller/cadastro_produto_controller.dart';
import 'package:app_estoque/modules/shere/widget/button_widget.dart';
import 'package:app_estoque/modules/shere/widget/text_field_widget.dart';
import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:app_estoque/widget/dropdown_widget.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CadastroProdutoPage extends StatefulWidget {
  const CadastroProdutoPage({super.key});

  @override
  State<CadastroProdutoPage> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState
    extends MState<CadastroProdutoPage, CadastroProdutoController> {
  @override
  void initState() {
    super.registerController(CadastroProdutoController());
    controller.context = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        titulo: "Cadastro de Produto",
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  left: 5.w,
                  right: 5.w),
              child: ListView(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => controller.tiraFoto(ImageSource.camera),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: bancoSujo,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Obx(() => controller.mostraImagem.value
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(2.h),
                                  child: Image.file(
                                    controller.imagem!,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : const Center(
                                  child: FaIcon(FontAwesomeIcons.camera))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                            vertical: MediaQuery.of(context).size.width * 0.03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.01),
                              child: GestureDetector(
                                onTap: () =>
                                    controller.tiraFoto(ImageSource.camera),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  decoration: const BoxDecoration(
                                    color: brancoFumaca,
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
                                color: brancoFumaca,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: GestureDetector(
                                    onTap: () => controller
                                        .startBarcodeScanStream(context),
                                    child: const TextWidget("Novo Código")),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () => controller.mostraQrCode.value
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(1.w),
                                  child: Image.memory(
                                    width: 22.w,
                                    height: 11.h,
                                    controller.qrImageBytes!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: TextFieldWidget(
                      controller: controller.nomeController,
                      titulo: "Nome",
                      labelExterno: "Nome",
                      labelInterno: 'Digite o nome do produto',
                      textColor: preto,
                      hintText: '',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: TextFieldWidget(
                      labelExterno: "Marca",
                      controller: controller.marcaController,
                      titulo: "Marca",
                      labelInterno: 'Digite o marca do produto',
                      textColor: preto,
                      hintText: '',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Obx(
                      () => DropDownWidget(
                        borderColor: lightGray,
                        hintText: controller.categoriaText.value.isEmpty
                            ? "Selecione uma Categoria"
                            : controller.categoriaNomeString!,
                        label: 'Categoria',
                        onChanged: (value) =>
                            controller.selectCategoria(value!),
                        itens: controller.drop
                            .map((e) =>
                                DropdownItem(id: e.id, texto: e.description))
                            .toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 42.w,
                          child: TextFieldWidget(
                            titulo: "SKU",
                            labelExterno: "SKU",
                            hintText: "Digite o SKU",
                            controller: controller.skuController,
                            keyboardType: TextInputType.number,
                            labelInterno: 'Digite o SKU',
                            textColor: preto,
                          ),
                        ),
                        SizedBox(
                          width: 42.w,
                          child: TextFieldWidget(
                            labelExterno: "Quantidade",
                            titulo: "Quantidade",
                            controller: controller.quantController,
                            labelInterno: 'Digite a qnt',
                            keyboardType: TextInputType.number,
                            textColor: preto,
                            hintText: '',
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 42.w,
                          child: TextFieldWidget(
                            titulo: "Valor Compra",
                            labelExterno: "Valor de Compra",
                            hintText: "Digite o valor de compra",
                            controller: controller.controllerValorCompra,
                            labelInterno: 'Valor de compra',
                            keyboardType: TextInputType.number,
                            textColor: preto,
                          ),
                        ),
                        SizedBox(
                          width: 42.w,
                          child: TextFieldWidget(
                            titulo: "Valor Venda",
                            labelExterno: "Valor de Venda",
                            hintText: "Digite o valor de compra",
                            controller: controller.controllerValorVenda,
                            keyboardType: TextInputType.number,
                            labelInterno: 'Valor de Venda',
                            textColor: preto,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                ],
              ),
            ),
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonWidget(
                  "SALVAR",
                  onPressed: () => controller.cadastroProduto(),
                ),
              )
          ],
        ));
  }
}
