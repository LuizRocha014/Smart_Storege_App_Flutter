import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final String? labelText;
  final String? titulo;
  final TextEditingController controller;
  const TextFieldWidget(
      {super.key, this.hintText, this.helperText, this.labelText, required this.controller, this.titulo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  const EdgeInsets.only(left: 5),
            child:  TextWidget(titulo??"", textColor: Colors.black,fontWeight: FontWeight.w500,),
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              helperText: helperText,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ],
      ),
    );
  }
}
