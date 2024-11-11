import 'package:app_estoque/base/context/app_context.dart';
import 'package:app_estoque/modules/login/page/login_page.dart';

import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/instances.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  initInstances();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool firstFrameAllowed = false;
    debugPaintSizeEnabled = false;
    RendererBinding.instance.deferFirstFrame();
    if (!instanceManager.exists<IContext>()) {
      instanceManager.registerLazySingleton<IContext>(() => AppContext());
      final context = instanceManager.get<IContext>();
      context.initializeDatabase();
      initAppInfos();
    }
    // initDotenv();

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            if (MediaQuery.of(context).size == Size.zero) {
              return const SizedBox();
            }
            if (!firstFrameAllowed) {
              RendererBinding.instance.allowFirstFrame();
              firstFrameAllowed = true;
            }
            AppMeasurements.setAppMeasurements(context);
            if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
              return const SizedBox();
            }
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: GetMaterialApp(
                builder: (context, child) {
                  return ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: child ?? const SizedBox(),
                  );
                },
                supportedLocales: const [
                  Locale('pt', ''),
                ],
                locale: const Locale('pt', ''),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                title: 'App Estoque',
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.dark,
                theme: ThemeData(
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  useMaterial3: false,
                  textSelectionTheme: const TextSelectionThemeData(
                    cursorColor: primaryColor,
                    selectionColor: primaryColor,
                    selectionHandleColor: primaryColor,
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(primaryColor),
                    ),
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                  ),
                  buttonTheme: const ButtonThemeData(
                    buttonColor: primaryColor,
                  ),
                ),
                home: const LoginPage(),
              ),
            );
          },
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
