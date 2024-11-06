import 'package:app_estoque/modules/login/controllers/sync_controller.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends MState<MyWidget, SyncController> {
  @override
  void initState() {
    super.registerController(SyncController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [Container()],
      ),
    );
  }
}
