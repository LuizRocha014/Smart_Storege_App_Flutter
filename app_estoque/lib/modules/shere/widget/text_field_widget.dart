import 'package:app_estoque/modules/shere/widget/icon_button_widget.dart';
import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final double? fontSize;
  final String? labelExterno;
  final String labelInterno;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final void Function()? onTapSuffixIcon;
  final Color color;
  final Color? iconColor;
  final Color textColor;
  final double? borderRadius;
  final Color? colorLabelExterno;
  final Color? hintTextColor;
  final double? hintFontSize;
  final FontWeight? hintFontWeight;
  final FontWeight? labelExternoFontWeight;
  final double? labelExternoFontSize;
  final int? maxLines;
  final Color? suffixColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? enabled;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool readOnly;
  final void Function()? onTapInfoIcon;
  final int? maxLength;
  final bool? autofocus;
  final AutovalidateMode? autovalidateMode;
  const TextFieldWidget(
      {super.key,
      required this.controller,
      this.labelExterno,
      required this.labelInterno,
      this.prefixIcon,
      this.obscureText = false,
      this.suffixIcon,
      this.onTapSuffixIcon,
      required this.color,
      this.iconColor,
      required this.textColor,
      this.borderRadius,
      this.colorLabelExterno,
      this.hintTextColor,
      this.hintFontSize,
      this.hintFontWeight,
      this.labelExternoFontWeight,
      this.labelExternoFontSize,
      this.suffixColor,
      this.fontSize,
      this.maxLines,
      this.inputFormatters,
      this.keyboardType,
      this.enabled,
      this.validator,
      this.onFieldSubmitted,
      this.focusNode,
      this.onTapInfoIcon,
      this.readOnly = false,
      this.maxLength,
      this.autofocus,
      this.autovalidateMode,
      required String titulo,
      required String hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelExterno != null)
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(labelExterno!,
                    fontSize: labelExternoFontSize,
                    textColor: colorLabelExterno ?? CoresDoAplicativo.preto,
                    fontWeight: labelExternoFontWeight ?? FontWeight.w400),
                if (onTapInfoIcon != null)
                  IconButtonWidget(
                      onPressed: onTapInfoIcon,
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: CoresDoAplicativo.preto,
                        size: 2.h,
                      ))
              ],
            ),
          ),
        TextFormField(
          autovalidateMode: autovalidateMode,
          autofocus: autofocus ?? false,
          maxLength: maxLength,
          onFieldSubmitted: onFieldSubmitted,
          enabled: enabled,
          focusNode: focusNode,
          controller: controller,
          readOnly: readOnly,
          obscureText: obscureText,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: labelInterno,
            counterText: '',
            errorMaxLines: 2,
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, color: iconColor, size: 1.8.h),
            suffixIcon: suffixIcon == null
                ? null
                : GestureDetector(
                    onTap: onTapSuffixIcon,
                    child: Icon(suffixIcon, color: (suffixColor != null) ? suffixColor : iconColor, size: 1.8.h)),
            hintStyle: TextStyle(
              color: CoresDoAplicativo.preto,
              fontSize: hintFontSize,
              fontWeight: hintFontWeight ?? FontWeight.normal,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: (borderRadius == null) ? (2.w) : 2.w, vertical: 0.5.h),
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            border: outlineInputBorder,
            errorBorder: outlineInputBorder,
            disabledBorder: outlineInputBorder,
            focusedErrorBorder: outlineInputBorder,
            filled: true,
            fillColor: color,
          ),
          style: TextStyle(color: textColor, fontSize: fontSize),
        ),
      ],
    );
  }

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderSide: const BorderSide(color: CoresDoAplicativo.gray, width: 1),
        borderRadius: BorderRadius.circular(borderRadius ?? 2.w),
      );
}
