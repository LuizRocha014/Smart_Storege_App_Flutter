import 'dart:async';
import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class LoadingButtonWidget extends StatefulWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? loadingColor;
  final Color? fontColor;
  final bool? ignoring;
  final double? height;
  final double? width;
  final String? iconePath;
  final FutureOr<void> Function()? onPressed;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final EdgeInsets? componentePadding;
  final bool utilizaLoading;
  final Widget? complementoTexto;
  final Color? borderColor;
  final Color? buttonColor;
  final bool mostraTexto;
  final bool isLoading;
  const LoadingButtonWidget({
    super.key,
    required this.title,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.fontColor,
    this.ignoring,
    required this.onPressed,
    this.width,
    this.height,
    this.iconePath,
    this.paddingVertical,
    this.paddingHorizontal,
    this.componentePadding,
    this.utilizaLoading = false,
    this.complementoTexto,
    this.borderColor,
    this.buttonColor,
    required this.mostraTexto,
    required this.isLoading,
    this.loadingColor,
  });

  @override
  State<LoadingButtonWidget> createState() => _LoadingButtonWidgetState();
}

class _LoadingButtonWidgetState extends State<LoadingButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.ignoring ?? false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: widget.paddingVertical ?? 0.25.h,
          horizontal: widget.paddingHorizontal ?? 0,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: widget.height,
          width: widget.width,
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.w),
                side: widget.borderColor == null
                    ? BorderSide.none
                    : BorderSide(color: widget.borderColor!),
              ),
              backgroundColor: widget.color ?? preto,
              fixedSize: Size(widget.width ?? 60.w, widget.height ?? 5.h),
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
            ),
            child: widget.isLoading
                ? SizedBox(
                    height: 5.w,
                    width: 5.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: widget.loadingColor ?? branco,
                    ),
                  )
                : AnimatedOpacity(
                    opacity: widget.mostraTexto ? 1 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Padding(
                      padding: widget.componentePadding ??
                          EdgeInsets.symmetric(
                              horizontal:
                                  widget.complementoTexto == null ? 0 : 2.w),
                      child: Row(
                        mainAxisAlignment: widget.complementoTexto == null
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            widget.title,
                            fontSize: widget.fontSize ?? font_16,
                            textColor: widget.fontColor ?? branco,
                            fontWeight: widget.fontWeight ?? FontWeight.bold,
                            //textAlign: TextAlign.center,
                          ),
                          if (widget.complementoTexto != null)
                            widget.complementoTexto!,
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
