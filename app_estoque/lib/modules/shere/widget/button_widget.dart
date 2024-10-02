import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String titulo;
  final Color? buttonColor;
  final double? peddinHori;
  final double? peddinVerti;
  const ButtonWidget(this.titulo,
      {super.key,
      this.onPressed,
      this.buttonColor,
      this.peddinHori,
      this.peddinVerti});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width * 0.1,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.height * 0.02),
            ),
          ),
          child: Center(
              child: TextWidget(
            titulo,
            textColor: branco,
            fontWeight: FontWeight.w500,
          )),
        ),
      ),
    );
  }
}
