import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:flutter/material.dart';

class CustomRich extends StatefulWidget {
  final double? fontSize;
  final String textFirt;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSizeSecund;
  final String textSecund;
  final FontWeight? fontWeightSecund;
  final Color? colorSecund;
  const CustomRich(
    this.textFirt,
    this.textSecund, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontSizeSecund,
    this.fontWeightSecund,
    this.colorSecund,
  });

  @override
  State<CustomRich> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomRich> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: widget.textFirt,
            style: TextStyle(
                fontSize: widget.fontSize ?? font_13,
                fontWeight: widget.fontWeight ?? FontWeight.w500,
                color: widget.color ?? gray)),
        TextSpan(
            text: widget.textSecund,
            style: TextStyle(
                fontSize: font_13,
                fontWeight: widget.fontWeightSecund,
                color: widget.colorSecund ?? lightGray)),
      ]),
    );
  }
}
