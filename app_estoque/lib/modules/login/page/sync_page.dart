import 'package:app_estoque/modules/login/controllers/sync_controller.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:app_estoque/utils/assets.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';

class SyncPage extends StatefulWidget {
  const SyncPage({super.key});

  @override
  State<SyncPage> createState() => _SyncPageState();
}

class _SyncPageState extends MState<SyncPage, SyncController> {
  @override
  void initState() {
    super.registerController(SyncController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: preto,
      body: Stack(
        children: [
          Lottie.asset(
            gifSinc,
            fit: BoxFit.fill,
            reverse: true,
            width: 100.w,
          ),
          Obx(
            () => Visibility(
              visible: controller.teveErro.value,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 1.h, left: 1.w),
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: branco,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, bottom: 1.h),
                    child: TextWidget(
                      "Sincronizando Dados",
                      fontWeight: FontWeight.w700,
                      fontSize: font_18,
                      textColor: branco,
                    ),
                  ),
                  const TextWidget(
                    "Estamos preparando o aplicativo",
                    textColor: branco,
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 70.w,
                        height: 1.5.h,
                        child: LinearProgressIndicator(
                          backgroundColor: gray,
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5),
                          value: controller.progress / 100,
                        ),
                      ),
                      TextWidget(
                        "${controller.progress.round()}%",
                        textColor: branco,
                      ),
                    ],
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.teveErro.value,
                      child: Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: ButtonWidget(
                          title: "REFAZER SINCRONISMO",
                          onPressed: () => controller.iniciaControlador(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
