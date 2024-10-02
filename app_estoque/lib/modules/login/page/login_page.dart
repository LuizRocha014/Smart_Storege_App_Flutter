import 'package:app_estoque/modules/login/controllers/login_controller.dart';
import 'package:app_estoque/modules/shere/widget/text_field_widget.dart';
import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/assets.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

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
                    color: branco,
                    textColor: preto,
                    titulo: "",
                    colorLabelExterno: preto,
                    labelExterno: "Usuário",
                    labelExternoFontWeight: FontWeight.w500,
                    hintText: ""),
                SizedBox(
                  height: 2.h,
                ),
                TextFieldWidget(
                    controller: controller.passWord,
                    labelInterno: "Senha",
                    color: branco,
                    textColor: preto,
                    colorLabelExterno: preto,
                    titulo: "",
                    labelExterno: "Senha",
                    labelExternoFontWeight: FontWeight.w500,
                    hintText: ""),
                SizedBox(
                  height: 2.h,
                ),
                SlideAction(
                  height: 5.5.h,
                  sliderButtonIconSize: 2.h,
                  sliderButtonIconPadding: 1.h,
                  outerColor: primaryColor,
                  text: "Arraste para logar",
                  textStyle: TextStyle(fontSize: font_14, color: branco),
                  submittedIcon: const CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: branco,
                  ),
                  onSubmit: () => controller.login(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
