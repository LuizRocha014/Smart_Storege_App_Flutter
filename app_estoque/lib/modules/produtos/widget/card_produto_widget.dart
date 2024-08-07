import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/assets.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/image_assets_widget.dart';
import 'package:app_estoque/widget/rich_text_widet.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class CardProdutoWidget extends StatelessWidget {
  final String tituloProduto;
  final String categoriaProduto;
  final String quantidadeProduto;
  final String nomeCampoCorCateg;
  final bool selecionado;
  final String? imagem;
  final String valorProduto;
  const CardProdutoWidget(
      {super.key,
      required this.categoriaProduto,
      required this.quantidadeProduto,
      required this.tituloProduto,
      this.nomeCampoCorCateg = "",
      this.selecionado = false,
      this.imagem,
      required this.valorProduto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01),
          decoration: BoxDecoration(
            color: selecionado
                ? CoresDoAplicativo.primaryColor.withOpacity(0.2)
                : CoresDoAplicativo.branco,
            border: Border.all(color: CoresDoAplicativo.gray),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CoresDoAplicativo.primaryColor),
                      child: ImageAsset(
                        imagem ?? AssetsAplicativo.iconPhonto,
                        height: 5.h,
                        color: CoresDoAplicativo.branco,
                        width: 10.w,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          tituloProduto,
                          fontSize: FontesDoAplicativo.textMedium,
                        ),
                        if (nomeCampoCorCateg.isNotEmpty)
                          CustomRich(nomeCampoCorCateg, categoriaProduto),
                        if (quantidadeProduto.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height * 0.002),
                            child: CustomRich(
                              "Quantidade: ",
                              quantidadeProduto,
                              color: CoresDoAplicativo.preto,
                              colorSecund: CoresDoAplicativo.gray,
                            ),
                          ),
                        CustomRich(
                          "Valor: ",
                          valorProduto,
                          color: CoresDoAplicativo.lightGray,
                          colorSecund: CoresDoAplicativo.gray,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
