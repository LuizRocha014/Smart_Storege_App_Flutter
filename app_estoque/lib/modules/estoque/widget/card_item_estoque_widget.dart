import 'package:app_estoque/utils/assets.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/rich_text_widet.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';

class CardItemEstoquetWidget extends StatefulWidget {
  final String titulo;
  final String valor;
  final String? quantidade;
  final String? marca;
  final void Function()? onTapMore;
  final void Function()? onTapless;
  const CardItemEstoquetWidget(
      {super.key,
      required this.titulo,
      required this.valor,
      required this.quantidade,
      this.onTapMore,
      this.onTapless,
      this.marca});

  @override
  State<CardItemEstoquetWidget> createState() => _CardItemSelectWidgetState();
}

class _CardItemSelectWidgetState extends State<CardItemEstoquetWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            decoration: BoxDecoration(
              color: branco,
              borderRadius: BorderRadius.circular(1.h),
            ),
            child: Row(
              children: [
                // Imagem do Produto
                ClipRRect(
                  borderRadius: BorderRadius.circular(1.h),
                  child: Image.asset(
                    iconPhonto, // Altere para a URL da imagem
                    width: 12.w,
                    height: 6.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 2.h),

                // Nome do Produto e Preço
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.titulo,
                        style: TextStyle(
                          fontSize: font_16,
                          color: preto,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      CustomRich("Marca: ", widget.marca.toString()),
                      CustomRich("Quantidade: ", widget.quantidade.toString()),
                    ],
                  ),
                ),

                // Botões de + e - para quantidade
              ],
            ),
          ),
          Divider(
            height: 1.h,
            color: preto,
          )
        ],
      ),
    );
  }
}
