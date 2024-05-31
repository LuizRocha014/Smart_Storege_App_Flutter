import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:flutter/material.dart';

class NewBackGroundDefault extends StatelessWidget {
  final Widget? widget;
  final Widget? widgetContainer;
  const NewBackGroundDefault({super.key,this.widget, this.widgetContainer});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.37,
              decoration: const BoxDecoration(color: CoresDoAplicativo.primaryColor),
              child: widgetContainer,
            ),
            if(widget != null)
            widget!,
          ],
        ),
      ),
    );
  }
}