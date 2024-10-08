import 'dart:developer';

import 'package:app_estoque/base/service/interface/icategory_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    if (task == "simpleTask") {
      log("Sincronizando...");
      instanceManager.get<ICategoryService>().getAll();
    }
    return Future.value(true);
  });
}
