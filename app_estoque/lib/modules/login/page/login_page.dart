import 'package:app_estoque/modules/login/controllers/login_controller.dart';
import 'package:app_estoque/modules/login/widget/loding_button_widget.dart';
import 'package:app_estoque/modules/shere/widget/text_field_widget.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends MState<LoginPage, LoginController> {
  @override
  void initState() {
    super.registerController(LoginController());
    controller.context = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoresDoAplicativo.branco.withOpacity(0.9),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
        child: ListView(
          children: [
            const SizedBox(
              height: 150,
            ),
            Center(
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
                controller: controller.userName,
              ),
            ),
            TextFieldWidget(
              titulo: "Senha",
              hintText: "Digite seu senha",
              controller: controller.passWord,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.height * 0.05,
                  right: MediaQuery.of(context).size.height * 0.05),
              child: Obx(
                () => LoadingButtonWidget(
                  onPressed: () async => controller.login(),
                  title: "ENTRAR",
                  color: CoresDoAplicativo.primaryColor,
                  mostraTexto: !controller.isLoading,
                  isLoading: controller.isLoading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
