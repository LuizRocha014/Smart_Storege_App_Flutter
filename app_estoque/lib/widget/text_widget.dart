import 'dart:ffi';

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String texto;
  final TextDecoration? decoration;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  const TextWidget(this.texto,
      {super.key, this.decoration, this.textColor, this.fontSize, this.fontWeight,});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
          decoration: decoration,
          color: textColor ?? Colors.black,
          fontSize: fontSize,
          fontWeight: fontWeight ),
    );
  }
}
