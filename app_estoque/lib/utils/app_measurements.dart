import 'package:flutter/widgets.dart';

class AppMeasurements {
  late final bool isMobile;
  late final double deviceHeight;
  late final double deviceWidth;

  static late AppMeasurements instance;
  factory AppMeasurements() => instance;
  AppMeasurements._internal();

  static void setAppMeasurements(BuildContext context) {
    instance = AppMeasurements._internal()
      ..isMobile = MediaQuery.of(context).size.width < 600
      ..deviceHeight = MediaQuery.of(context).size.height
      ..deviceWidth = MediaQuery.of(context).size.width;
  }
}

extension ExtensionMedidasAplicativo on num {
  double get w => AppMeasurements.instance.deviceWidth * (this / 100);

  double get h => AppMeasurements.instance.deviceHeight * (this / 100);

  double get sp => this * (AppMeasurements.instance.deviceWidth / 360);
}
