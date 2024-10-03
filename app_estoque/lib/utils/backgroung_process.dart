import 'dart:developer';

import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    if (task == "simpleTask") {
      log("Sincronizando dados com o servidor...");
    }
    // Retorna true quando a tarefa é completada com sucesso
    return Future.value(true);
  });
}
