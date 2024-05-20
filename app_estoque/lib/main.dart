import 'package:app_estoque/modules/login/page/login_page.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
  
