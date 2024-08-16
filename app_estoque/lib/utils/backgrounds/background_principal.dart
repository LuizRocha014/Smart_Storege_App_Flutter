import 'package:app_estoque/modules/shere/widget/button_widget.dart';
import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatefulWidget {
  final Widget? child;
  final String? titulo;
  final Widget? floatingActionButton;
  final bool enableBackButton;
  final Color? backgroundColor;
  final String? tituloButton;
  const BackgroundWidget(
      {super.key,
      this.child,
      this.titulo,
      this.floatingActionButton,
      this.enableBackButton = true,
      this.backgroundColor,
      this.tituloButton});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: widget.floatingActionButton,
        backgroundColor: CoresDoAplicativo.primaryColor,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  left: MediaQuery.of(context).size.height * 0.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02),
                    child: Visibility(
                      visible: widget.titulo != null ? true : false,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          children: [
                            Visibility(
                              visible: widget.enableBackButton,
                              replacement: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextWidget(
                                  widget.titulo ?? "",
                                  textColor: CoresDoAplicativo.branco,
                                  fontSize: FontesDoAplicativo.textMedium,
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: CoresDoAplicativo.branco,
                                  ),
                                  TextWidget(
                                    widget.titulo ?? "",
                                    textColor: CoresDoAplicativo.branco,
                                    fontSize: FontesDoAplicativo.textMedium,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(3.h),
                              topRight: Radius.circular(3.h)),
                          color: widget.backgroundColor ??
                              CoresDoAplicativo.branco),
                      child: widget.child,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.tituloButton != null &&
                MediaQuery.of(context).viewInsets.bottom == 0)
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonWidget(widget.tituloButton ?? ""),
              ),
          ],
        ),
      ),
    );
  }
}
