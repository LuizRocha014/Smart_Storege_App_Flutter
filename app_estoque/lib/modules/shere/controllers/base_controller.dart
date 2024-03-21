import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:get/state_manager.dart';

abstract class BaseController extends GetxController  {
  late RxBool _isLoading;
  late final GlobalKey<FormState> _formKey;
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

}