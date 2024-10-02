import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
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
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Container(
        height: 10.h,
        decoration: BoxDecoration(
            border: Border.all(color: lightGray),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Container(
                height: 8.h,
                width: 16.w,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.5.h),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(tituloProduto),
                      CustomRich("Valor: ", valorProduto),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // return Padding(
    //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
    //   child: Container(
    //       padding: EdgeInsets.symmetric(
    //           vertical: MediaQuery.of(context).size.height * 0.01),
    //       decoration: BoxDecoration(
    //         color: selecionado
    //             ?  primaryColor.withOpacity(0.2)
    //             :  branco,
    //         border: Border.all(color:  gray),
    //         borderRadius: BorderRadius.circular(20),
    //       ),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             children: [
    //               Padding(
    //                 padding: EdgeInsets.only(
    //                     left: MediaQuery.of(context).size.width * 0.02),
    //                 child: Container(
    //                   padding:
    //                       EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(10),
    //                       color:  primaryColor),
    //                   child: ImageAsset(
    //                     imagem ??   iconPhonto,
    //                     height: 5.h,
    //                     color:  branco,
    //                     width: 10.w,
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.symmetric(
    //                     vertical: MediaQuery.of(context).size.height * 0.01,
    //                     horizontal: MediaQuery.of(context).size.width * 0.04),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     TextWidget(
    //                       tituloProduto,
    //                       fontSize:   font_16,
    //                     ),
    //                     SizedBox(
    //                       height: 2.5.h,
    //                     ),
    //                     Row(
    //                       children: [
    //                         CustomRich(
    //                           "Valor: ",
    //                           valorProduto,
    //                           color:  gray,
    //                           colorSecund:  lightGray,
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       )),
    // );
  }
}
