import 'dart:async';

import 'package:app_estoque/base/repository/interface/smartStorege/ishop_user_repository.dart';
import 'package:app_estoque/base/service/interface/iuser_service.dart';
import 'package:app_estoque/modules/menu/pages/home_page.dart';
import 'package:app_estoque/base/models/smartStorege/user/user.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/utils/synchronize.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:boleto_utils/boleto_utils.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:app_estoque/utils/infos_statica.dart' as sai;
import 'package:get/get.dart';

class LoginController extends BaseController {
  late TextEditingController passWord;
  late TextEditingController userName;
  late RxBool mostraSenha;
  late User usuarioLogin;
  late BoletoUtils boletoUtils;
  BoletoValidado? boletoValidado;
  StreamSubscription? streamBarcode;

  @override
  void iniciaControlador() {
    userName = TextEditingController();
    passWord = TextEditingController();
    mostraSenha = RxBool(false);
    userName.text = "LuizRocha";
    passWord.text = "Aplicativo@2024";
  }

  void flagSenha() {
    mostraSenha.value = !mostraSenha.value;
    mostraSenha.refresh();
  }

  Future<void> login() async {
    try {
      isLoading = true;
      final retorno = await instanceManager
          .get<IUserService>()
          .login(userName.text, passWord.text);
      if (retorno == null) throw Exception();
      sai.loggerUser = retorno;
      await instanceManager.get<Synchronism>().fullSync(forcaSincronismo: true);

      final shop = await instanceManager
          .get<IShopUserRepository>()
          .getShopUserId(retorno.id);
      sai.shopUser = shop;
      // ignore: use_build_context_synchronously
      context.push(const HomePage());
      isLoading = false;
    } catch (_) {
      showModalBottomSheet(
        // ignore: use_build_context_synchronously
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
          decoration: BoxDecoration(
              color: branco,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.h),
                  topRight: Radius.circular(2.h))),
          width: double.infinity,
          height: 20.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.025),
                  child: TextWidget(
                    "Insira o desconto desejado",
                    fontSize: font_18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.025),
                  child: TextWidget(
                    "Login ou senha incorretos, tente novamente",
                    fontSize: font_14,
                  ),
                ),
                const Spacer(),
                ButtonWidget(
                  onPressed: () => Navigator.pop(context),
                  borderRadius: 2.h,
                  title: "ENTENDI",
                ),
              ],
            ),
          ),
        ),
      );
    } finally {
      isLoading = false;
    }
  }
}
