import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EstoqueProdutosPage extends StatelessWidget {
  const EstoqueProdutosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      titulo: "Estoque",
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Container(
            height: 150,
            decoration: BoxDecoration(border: Border.all(color: CoresDoAplicativo.gray),
                color: CoresDoAplicativo.branco,
                
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: const Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
