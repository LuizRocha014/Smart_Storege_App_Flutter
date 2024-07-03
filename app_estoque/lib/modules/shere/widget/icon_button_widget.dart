import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final Widget child;
  final BoxConstraints? constraints;
  final Color? color;
  final void Function()? onPressed;
  const IconButtonWidget({super.key, required this.child, this.onPressed, this.color, this.constraints});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed, icon: child, padding: EdgeInsets.zero, constraints: constraints ?? const BoxConstraints());
  }
}
