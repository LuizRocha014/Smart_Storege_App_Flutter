import 'dart:async';

import 'package:app_estoque/base/models/user/user.dart';
import 'package:app_estoque/base/service/interface/iuser_service.dart';
import 'package:app_estoque/modules/menu/pages/home_page.dart';
import 'package:app_estoque/modules/shere/widget/button_widget.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/utils/routes.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:boleto_utils/boleto_utils.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:flutter/material.dart';

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
    passWord.text = "Roch@1204";
  }

  Future<void> login() async {
    try {
      isLoading = true;
      final retorno = await instanceManager.get<IUserService>().login(userName.text, passWord.text);
      if (retorno == null) throw Exception();
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
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
                child: TextWidget(
                  "Aviso!",
                  fontSize: FontesDoAplicativo.titloText,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
                child: const TextWidget("Login ou senha incorretos, tente novamente!"),
              ),
              const Spacer(),
              ButtonWidget(
                "ENTENDI",
                peddinVerti: 10,
                onPressed: () => Navigator.pop(context),
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
