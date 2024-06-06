import 'package:app_estoque/base/context/context.dart';
import 'package:app_estoque/modules/login/page/login_page.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
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
    Get.create(() => Context());
    Get.find<Context>().initializeDatabase();
    
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
