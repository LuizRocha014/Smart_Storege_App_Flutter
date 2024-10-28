import 'dart:async';

import 'package:app_estoque/base/repository/interface/smartStorege/ishop_user_repository.dart';
import 'package:app_estoque/base/service/interface/iuser_service.dart';
import 'package:app_estoque/modules/menu/pages/home_page.dart';
import 'package:app_estoque/base/models/smartStorege/user/user.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/utils/synchronize.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:boleto_utils/boleto_utils.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:app_estoque/utils/infos_statica.dart' as sai;

class LoginController extends BaseController {
  late TextEditingController userName;
  late TextEditingController passWord;
  late User usuarioLogin;
  late BoletoUtils boletoUtils;
  BoletoValidado? boletoValidado;
  StreamSubscription? streamBarcode;

  @override
  void iniciaControlador() {
    userName = TextEditingController();
    passWord = TextEditingController();

    userName.text = "LuizRocha";
    passWord.text = "Aplicativo@2024";
  }

  Future<void> login() async {
    try {
      isLoading = true;
      final retorno = await instanceManager
          .get<IUserService>()
          .login(userName.text, passWord.text);
      if (retorno == null) throw Exception();
      sai.loggerUser = retorno;
      await instanceManager
          .get<Synchronism>()
          .iniciarSincronismoGets(forcaDataAlteracaoNula: true);

      final shopUser = await instanceManager
          .get<IShopUserRepository>()
          .getShopUserId(retorno.id);
      sai.shopUser = shopUser;
      // ignore: use_build_context_synchronously
      context.push(const HomePage());
      isLoading = false;
    } catch (_) {
      showModalBottomSheet(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.025),
                child: TextWidget(
                  "Aviso!",
                  fontSize: font_18,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: const TextWidget(
                    "Login ou senha incorretos, tente novamente!"),
              ),
              const Spacer(),
              ButtonWidget(
                onPressed: () => Navigator.pop(context),
                title: "ENTENDI",
              ),
            ],
          ),
        ),
      );
    } finally {
      isLoading = false;
    }
  }
}
