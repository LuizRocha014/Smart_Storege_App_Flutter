import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';

Future<void> poPupErrorDefault(
    BuildContext context, String titulo, String descricao) async {
  showModalBottomSheet(
    // ignore: use_build_context_synchronously
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      decoration: BoxDecoration(
          color: branco,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2.h), topRight: Radius.circular(2.h))),
      width: double.infinity,
      height: 25.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.025),
              child: Expanded(
                child: TextWidget(
                  titulo,
                  maxLines: null,
                  overflow: TextOverflow.visible,
                  fontSize: font_21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Expanded(
                child: TextWidget(
                  descricao,
                  textAlign: TextAlign.center,
                  maxLines: null,
                  overflow: TextOverflow.visible,
                  fontSize: font_16,
                ),
              ),
            ),
            const Spacer(),
            ButtonWidget(
              onPressed: () => Navigator.pop(context),
              borderRadius: 2.h,
              title: "ENTENDI",
            ),
          ],
        ),
      ),
    ),
  );
}
