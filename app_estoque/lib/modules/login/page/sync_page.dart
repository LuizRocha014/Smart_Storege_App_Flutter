import 'package:app_estoque/modules/login/controllers/sync_controller.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class SyncPage extends StatefulWidget {
  const SyncPage({super.key});

  @override
  State<SyncPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends MState<SyncPage, SyncController> {
  @override
  void initState() {
    super.registerController(SyncController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => AnimatedProgressBar(
            value: double.parse((controller.progressValue / 100).toString()),
            duration: const Duration(seconds: 3),
            gradient: const LinearGradient(
              colors: [
                primaryColor,
                secundaryColor,
              ],
            ),
            backgroundColor: Colors.grey.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
