import 'package:app_estoque/utils/assets.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackgroundPrincipal extends StatelessWidget {
  final String titulo;
  final Widget? childSecund;
  final bool? enableBackButton;
  final Widget? floatingActionButton;
  const BackgroundPrincipal({super.key, 
    required this.titulo,
     this.childSecund, this.enableBackButton, this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      backgroundColor: CoresDoAplicativo.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Visibility(
              visible: titulo.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 20),
                child: Row(
                  children: [
                    Visibility(
                      visible: enableBackButton?? true,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      titulo,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),
                    Expanded(child: childSecund!),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}