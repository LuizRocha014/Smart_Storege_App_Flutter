import 'package:app_estoque/modules/login/controllers/login_controller.dart';

import 'package:app_estoque/utils/assets.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';

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
      backgroundColor: fundoLoginColor,
      body: ListView(
        children: [
          Image.asset(
            iconLogoLogin,
            fit: BoxFit.fill,
            height: 40.h,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  "LOGIN",
                  fontSize: font_28,
                  fontWeight: FontWeight.w500,
                  textColor: primaryColor,
                ),
                TextWidget(
                  "Crie uma conta ou entre com uma conta já existente",
                  textColor: primaryColor,
                  fontSize: font_13,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFieldWidget(
                  controller: controller.userName,
                  labelInterno: "Usuário",
                  borderColor: gray,
                  color: branco,
                  externalLabelColor: preto,
                  textColor: preto,
                  externalLabel: "Usuário",
                  internalLabel: '',
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => TextFieldWidget(
                    borderColor: gray,
                    controller: controller.passWord,
                    labelInterno: "Senha",
                    color: branco,
                    textColor: preto,
                    externalLabelColor: preto,
                    externalLabel: "Senha",
                    externalLabelFontWeight: FontWeight.w500,
                    internalLabel: '',
                    suffixIcon: controller.mostraSenha.value
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                    onTapSuffixIcon: () => controller.flagSenha(),
                    obscureText: controller.mostraSenha.value,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: Obx(
                    () => LoadingButtonWidget(
                      color: primaryColor,
                      title: 'ENTRAR',
                      onPressed: () => controller.login(),
                      mostraTexto: !controller.isLoading,
                      isLoading: controller.isLoading,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
