import 'package:flutter/material.dart';

class InfosAplicativo {
  late final bool isMobile;
  late final double alturaDispositivo;
  late final double larguraDispositivo;

  static late InfosAplicativo instance;
  factory InfosAplicativo() => instance;
  InfosAplicativo._internal();

  static void setInfosAplicativo(BuildContext context) {
    instance = InfosAplicativo._internal()
      ..isMobile = MediaQuery.of(context).size.width < 600
      ..alturaDispositivo = MediaQuery.of(context).size.height
      ..larguraDispositivo = MediaQuery.of(context).size.width;
  }
}

extension MedidasAplicativo on num {
  double get w => InfosAplicativo.instance.larguraDispositivo * (this / 100);

  double get h => InfosAplicativo.instance.alturaDispositivo * (this / 100);

  double get sp => this * (InfosAplicativo.instance.larguraDispositivo / 360);
}
