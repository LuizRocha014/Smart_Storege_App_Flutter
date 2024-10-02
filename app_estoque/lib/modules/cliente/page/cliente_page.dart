import 'package:app_estoque/modules/cliente/controller/cliente_controller.dart';
import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/backgrounds/background_principal.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/utils/navigator.dart';
import 'package:app_estoque/widget/rich_text_widet.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class ClientePage extends StatefulWidget {
  const ClientePage({super.key});

  @override
  State<ClientePage> createState() => _ClientePageState();
}

class _ClientePageState extends MState<ClientePage, ClienteController> {
  @override
  void initState() {
    super.registerController(ClienteController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      icon: Icons.add,
      onTap: () => controller.novoCliente(),
      titulo: "Cliente",
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => Container(
            padding: EdgeInsets.symmetric(
              vertical: 1.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 8.h,
                      width: 16.w,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(1.h)),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          "Evaristo Pereira da Cunha Oliveira",
                          fontWeight: FontWeight.w500,
                          fontSize: font_16,
                        ),
                        const CustomRich("CPF:", "9999999999"),
                        const CustomRich("Telefone:", "9999999999"),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 2.h),
                const Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
