
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final String? labelText;
  final String? titulo;
  final double? widthLargura;
  final TextEditingController controller;
  const TextFieldWidget(
      {super.key, this.hintText, this.helperText, this.labelText, required this.controller, this.titulo, this.widthLargura});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:    EdgeInsets.only(left: MediaQuery.of(context).size.width *0.02),
          child:  TextWidget(titulo??"", textColor: Colors.black,fontWeight: FontWeight.w500,),
        ),
        SizedBox(
          width: widthLargura ?? double.infinity,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              helperText: helperText,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ),
      ],
    );
  }
}
