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
      backgroundColor: CoresDoAplicativo.fundoLoginColor,
      body: ListView(
        children: [
          Image.asset(
            AssetsAplicativo.iconLogoLogin,
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
                  fontSize: FontesDoAplicativo.font_28,
                  fontWeight: FontWeight.w500,
                  textColor: CoresDoAplicativo.primaryColor,
                ),
                TextWidget(
                  "Crie uma conta ou entre com uma conta já existente",
                  textColor: CoresDoAplicativo.primaryColor,
                  fontSize: FontesDoAplicativo.font_13,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFieldWidget(
                    controller: controller.userName,
                    labelInterno: "Usuário",
                    color: CoresDoAplicativo.branco,
                    textColor: CoresDoAplicativo.preto,
                    titulo: "",
                    labelExterno: "Usuário",
                    labelExternoFontWeight: FontWeight.w500,
                    hintText: ""),
                SizedBox(
                  height: 2.h,
                ),
                TextFieldWidget(
                    controller: controller.passWord,
                    labelInterno: "Senha",
                    color: CoresDoAplicativo.branco,
                    textColor: CoresDoAplicativo.preto,
                    titulo: "",
                    labelExterno: "Senha",
                    labelExternoFontWeight: FontWeight.w500,
                    hintText: ""),
                SizedBox(
                  height: 2.h,
                ),
                SlideAction(
                  height: 7.h,
                  sliderButtonIconSize: 3.h,
                  sliderButtonIconPadding: 1.h,
                  outerColor: CoresDoAplicativo.primaryColor,
                  text: "Arraste para logar",
                  textStyle: TextStyle(
                      fontSize: FontesDoAplicativo.font_14,
                      color: CoresDoAplicativo.branco),
                  submittedIcon: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: CoresDoAplicativo.branco,
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
