import 'package:app_estoque/base/context/app_context.dart';
import 'package:app_estoque/base/context/service/icontext.dart';
import 'package:app_estoque/modules/login/page/login_page.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/instances.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //static const url = '172.16.30.186:5031';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initInstances();
    instanceManager.registerLazySingleton<IContext>(() => AppContext(password: '1234'));
    final context = instanceManager.get<IContext>();
    context.initializeDatabase();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.amber,
        ).copyWith(
          primary: CoresDoAplicativo.primaryColor,
          secondary: CoresDoAplicativo.primaryColor,
        ),
      ),
      home: const LoginPage(),
    );
  }
}
