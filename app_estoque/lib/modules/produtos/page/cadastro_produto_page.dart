import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/modules/produtos/controller/cadastro_produto_controller.dart';
import 'package:app_estoque/utils/assets.dart';

import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/widget/dropdown_widget.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CadastroProdutoPage extends StatefulWidget {
  final Product? product;
  const CadastroProdutoPage({super.key, this.product});

  @override
  State<CadastroProdutoPage> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState
    extends MState<CadastroProdutoPage, CadastroProdutoController> {
  @override
  void initState() {
    super.registerController(CadastroProdutoController(widget.product));
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
                            color: brancoSujo,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Obx(() => controller.mostraImagem.value
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(2.h),
                                  child: controller.product != null
                                      ? Image.memory(
                                          controller.product!.image!,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.file(
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
                                    onTap: () => controller.validaCodBarras(),
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
                                  child: Image.asset(
                                    width: 22.w,
                                    height: 11.h,
                                    iconBarcode,
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
                      externalLabel: "Nome",
                      externalLabelColor: preto,
                      borderColor: gray,
                      internalLabel: 'Digite o nome do produto',
                      textColor: preto,
                      labelInterno: '',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: TextFieldWidget(
                      externalLabel: "Marca",
                      externalLabelColor: preto,
                      borderColor: gray,
                      controller: controller.marcaController,
                      labelInterno: "",
                      textColor: preto,
                      internalLabel: 'Digite o marca do produto',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Obx(
                      () => DropDownWidget(
                        borderColor: gray,
                        fillColor: branco,
                        labelColor: preto,
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
                            externalLabel: "SKU",
                            externalLabelColor: preto,
                            borderColor: gray,
                            controller: controller.skuController,
                            keyboardType: TextInputType.number,
                            internalLabel: 'Digite o SKU',
                            textColor: preto,
                            labelInterno: '',
                          ),
                        ),
                        SizedBox(
                          width: 42.w,
                          child: TextFieldWidget(
                            externalLabel: "Quantidade",
                            externalLabelColor: preto,
                            borderColor: gray,
                            controller: controller.quantController,
                            internalLabel: 'Digite a qnt',
                            keyboardType: TextInputType.number,
                            textColor: preto,
                            labelInterno: '',
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
                            externalLabel: "Valor  Compra",
                            externalLabelColor: preto,
                            borderColor: gray,
                            controller: controller.controllerValorCompra,
                            labelInterno: 'Valor de compra',
                            keyboardType: TextInputType.number,
                            textColor: preto,
                            inputFormatters: [valorRealFormatter()],
                            internalLabel: 'Digite o valor de compra',
                          ),
                        ),
                        SizedBox(
                          width: 42.w,
                          child: TextFieldWidget(
                            externalLabel: "Valor de Venda",
                            externalLabelColor: preto,
                            borderColor: gray,
                            internalLabel: "Digite o valor de compra",
                            controller: controller.controllerValorVenda,
                            keyboardType: TextInputType.number,
                            labelInterno: 'Valor de Venda',
                            inputFormatters: [valorRealFormatter()],
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
                child: LoadingButtonWidget(
                  onPressed: () => controller.cadastroProduto(),
                  title: "SALVAR",
                  color: primaryColor,
                  mostraTexto: !controller.isLoading,
                  isLoading: controller.isLoading,
                ),
              )
          ],
        ));
  }
}
