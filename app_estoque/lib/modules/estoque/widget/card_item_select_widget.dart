import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/assets.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:flutter/material.dart';

class CardItemSelectWidget extends StatefulWidget {
  final String titulo;
  final String valor;
  final String? quantidade;
  final void Function()? onTapMore;
  final void Function()? onTapless;
  const CardItemSelectWidget(
      {super.key,
      required this.titulo,
      required this.valor,
      required this.quantidade,
      this.onTapMore,
      this.onTapless});

  @override
  State<CardItemSelectWidget> createState() => _CardItemSelectWidgetState();
}

class _CardItemSelectWidgetState extends State<CardItemSelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            decoration: BoxDecoration(
              color: CoresDoAplicativo.branco,
              borderRadius: BorderRadius.circular(1.h),
            ),
            child: Row(
              children: [
                // Imagem do Produto
                ClipRRect(
                  borderRadius: BorderRadius.circular(1.h),
                  child: Image.asset(
                    AssetsAplicativo.iconPhonto, // Altere para a URL da imagem
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
                          fontSize: FontesDoAplicativo.font_16,
                          color: CoresDoAplicativo.preto,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        widget.valor,
                        style: const TextStyle(
                          color: CoresDoAplicativo.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                // Botões de + e - para quantidade
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add,
                          color: CoresDoAplicativo.primaryColor),
                      onPressed: widget.onTapMore,
                    ),
                    Text(
                      widget.quantidade ?? "0",
                      style: const TextStyle(
                          color: CoresDoAplicativo.preto, fontSize: 16),
                    ),
                    IconButton(
                        icon: const Icon(Icons.remove, color: Colors.grey),
                        onPressed: widget.onTapless)
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1.h,
            color: CoresDoAplicativo.preto,
          )
        ],
      ),
    );
  }
}
