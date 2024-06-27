import 'dart:developer';

import 'package:app_estoque/base/models/user/user.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// ignore: depend_on_referenced_packages
import 'package:get/state_manager.dart';

abstract class BaseController extends GetxController {
  late RxBool _isLoading;
  late final GlobalKey<FormState> _formKey;
  late final String url = "192.168.15.52:5031";
  late BuildContext context;
  late User? usuario;

  BaseController() {
    _isLoading = false.obs;
    _formKey = GlobalKey<FormState>();
    iniciaControlador();
  }
  void iniciaControlador();
  bool get isLoading => _isLoading.value;
  RxBool get isLoadingRx => _isLoading;
  GlobalKey<FormState> get formKey => _formKey;
  bool get formKeyValidate => formKey.currentState?.validate() ?? false;
  set isLoading(bool value) => _isLoading.value = value;

  Future<void> startBarcodeScanStream(BuildContext context) async {
    FlutterBarcodeScanner.scanBarcode(
      '#f97516',
      'CANCELAR',
      true,
      ScanMode.BARCODE,
    ).then(
      (barcode) async {
        log(barcode);
      },
    );
  }
}
