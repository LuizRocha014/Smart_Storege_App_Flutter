import 'package:app_estoque/modules/menu/pages/home_page.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/synchronize.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:get/get.dart';

class SyncController extends BaseController {
  late Synchronism controller;
  late RxInt _progress;
  @override
  void iniciaControlador() {
    _progress = RxInt(0);
    controller = instanceManager.get<Synchronism>();
    controller.fullSync(forcaSincronismo: true).then((e) {
      // ignore: use_build_context_synchronously
      context.push(const HomePage());
    });
  }

  int get progressValue => _progress.value;
}
