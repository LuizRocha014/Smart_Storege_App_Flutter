import 'package:app_estoque/modules/menu/pages/new_menu_inicial_page.dart';
import 'package:app_estoque/modules/shere/widget/button_widget.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/utils/service_erro.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:flutter/material.dart';

class LoginController extends BaseController with ErrorService {
  late TextEditingController userName;
  late TextEditingController passWord;

  @override
  void iniciaControlador() {
    userName = TextEditingController();
    passWord = TextEditingController();

    userName.text = "LuizRocha";
    passWord.text = "Roch@1204";
  }

  Future<void> login(BuildContext context) async {
    try {
      //
      final uri = Uri.http(url, "api/Usuario/login",
          {'UserName': userName.text, 'PassWord': passWord.text});

      final retonro = await http.get(uri);
      if(!logonCorreto(retonro)) throw Exception();
        Get.to(const NewMenuInicialPage());
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
                            child: const TextWidget(
                              "Aviso!",
                              fontSize: FontesDoAplicativo.titloText,
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.01),
                            child:  const TextWidget(
                                "Login ou senha incorretos, tente novamente!"),
                          ),
                          const Spacer(),
                           ButtonWidget("ENTENDI", peddinVerti:10, onPressed: () => Navigator.pop(context),),
                        ],
                      ),
                    ),
                  );
    }
  }
}
