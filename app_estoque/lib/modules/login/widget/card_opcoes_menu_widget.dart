import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';

class CardListMenuPrincipalWidget extends StatefulWidget {
  final String tituloCard;
  final String imageAssets;
  const CardListMenuPrincipalWidget(
      {super.key, required this.tituloCard, required this.imageAssets});

  @override
  State<CardListMenuPrincipalWidget> createState() =>
      _CardListMenuPrincipalWidgetState();
}

class _CardListMenuPrincipalWidgetState
    extends State<CardListMenuPrincipalWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: primaryColor),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.imageAssets,
                height: 80,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                widget.tituloCard,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
