import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatefulWidget {
  final Widget? child;
  final String? titulo;
    final Widget? floatingActionButton;
  const BackgroundWidget({super.key, this.child, this.titulo, this.floatingActionButton});

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
        body: Padding(
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
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: CoresDoAplicativo.branco,
                      ),
                      TextWidget(
                        widget.titulo ?? "",
                        fontSize: FontesDoAplicativo.textMedium,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: CoresDoAplicativo.branco),
                  child: widget.child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
