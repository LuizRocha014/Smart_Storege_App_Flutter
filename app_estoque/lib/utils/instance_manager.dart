import 'dart:developer';

import 'package:app_estoque/utils/utils_exports.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class InstanceManager {
  final _instanceManager = GetIt.instance;
  static final InstanceManager _instance = InstanceManager._internal();

  factory InstanceManager() {
    return _instance;
  }

  InstanceManager._internal();

  void registerLazySingleton<T extends Object>(T Function() func) {
    _instanceManager.registerLazySingleton<T>(func);
  }

  void registerSingleton<T extends Object>(T instance, {String? instanceName}) {
    _instanceManager.registerSingleton<T>(instance, instanceName: instanceName);
  }

  T get<T extends Object>({String? tag}) {
    return _instanceManager.get<T>(instanceName: tag);
  }

  bool exists<T extends Object>({String? tag}) {
    if (tag != null) {
      try {
        return instanceManager.getByString<T>(tag) != null;
      } catch (e) {
        return false;
      }
    }
    return _instanceManager.isRegistered<T>(instanceName: tag);
  }

  T? getByString<T extends Object>(String instanceName) {
    return _instanceManager.get<T>(instanceName: instanceName);
  }

  void reset() {
    _instanceManager.reset();
  }

  void delete<T extends Object>({String? tag}) {
    if (exists<T>(tag: tag)) {
      _instanceManager.unregister<T>(instanceName: tag);
    }
  }

  void deleteByString<T extends Object>(String instanceName) {
    _instanceManager.unregister<T>(instanceName: instanceName);
  }

  void removeControllersFromRoute(String? routeName) {
    if (routeName == null) return;
    try {
      final controllerName = '${routeName.split('Page').first}Controller';
      deleteByString(controllerName);
    } catch (e) {
      log('Erro ao remover controller da rota: $routeName: $e');
    }
  }
}

extension InstanceManagerExtension on BuildContext {
  T registerController<T extends Object>(T controller, {String? tag}) {
    if (!InstanceManager().exists<T>(tag: tag)) {
      InstanceManager().registerSingleton<T>(controller, instanceName: tag);
    }
    assignContext<T>(tag: tag);
    final instance = InstanceManager().get<T>(tag: tag);
    return instance;
  }

  void assignContext<T extends Object>({String? tag}) {
    final instance = InstanceManager().get<T>(tag: tag);
    try {
      // ignore: avoid_dynamic_calls
      (instance as dynamic).context = this;
    } catch (e) {
      log('A variável não existe nesta instância da classe.');
    }
  }
}
