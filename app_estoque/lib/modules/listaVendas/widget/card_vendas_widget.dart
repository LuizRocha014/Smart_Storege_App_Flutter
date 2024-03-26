import 'package:app_estoque/utils/conversores.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/rich_text_widet.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class CardVendasWidget extends StatefulWidget {
  final String numVenda;
  final String nomeVendedor;
  final String dataString;
  final double valorVenda;
  const CardVendasWidget(
      {super.key,
      required this.numVenda,
      required this.nomeVendedor,
      required this.dataString,
      required this.valorVenda});

  @override
  State<CardVendasWidget> createState() => _CardVendasWidgetState();
}

class _CardVendasWidgetState extends State<CardVendasWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(color: CoresDoAplicativo.lightGray),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.03,
              right:  MediaQuery.of(context).size.width * 0.03,
              top: MediaQuery.of(context).size.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    widget.numVenda,
                    fontSize: FontesDoAplicativo.tituloCardVenda,
                    textColor: CoresDoAplicativo.textGray,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: CoresDoAplicativo.lightGray,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Container(
                color: CoresDoAplicativo.lightGray,
                height: MediaQuery.of(context).size.height * 0.001,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomRich("Vendedor: ", widget.nomeVendedor),
              CustomRich("Data: ", widget.dataString),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(
                      "Total",
                      fontWeight: FontWeight.bold,
                      fontSize: FontesDoAplicativo.textMedium,
                    ),
                    const Spacer(),
                    TextWidget(
                      Conversores.formatarValorEmReal(widget.valorVenda),
                      fontWeight: FontWeight.bold,
                      fontSize: FontesDoAplicativo.textMedium,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
