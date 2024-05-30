
import 'package:app_estoque/modules/login/controllers/login_controller.dart';
import 'package:app_estoque/modules/shere/widget/button_widget.dart';
import 'package:app_estoque/modules/shere/widget/text_field_widget.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController _controller;
  @override
  void initState() {
    _controller = Get.put(LoginController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoresDoAplicativo.branco.withOpacity(0.9),
      body: ListView(
        children: [
          const SizedBox(
            height: 150,
          ),
          const Center(
            child: TextWidget(
              "LOGIN",
              fontSize: FontesDoAplicativo.titloLogin,
              fontWeight: FontWeight.w500,
              textColor: CoresDoAplicativo.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextFieldWidget(
              titulo: "Usuário",
              hintText: "Digite seu usuário",
              controller: _controller.userName,
            ),
          ),
          TextFieldWidget(
            titulo: "Senha",
            hintText: "Digite seu senha",
            controller: _controller.passWord,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
                left: MediaQuery.of(context).size.height * 0.05,
                right: MediaQuery.of(context).size.height * 0.05),
            child: ButtonWidget(
              "ENTRAR",
              onPressed: () async =>
                  await _controller.startBarcodeScanStream(context),
            ),
          ),
        ],
      ),
    );
  }
}
