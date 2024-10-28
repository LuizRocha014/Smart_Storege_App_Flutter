import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';

class DropDownWidget<T> extends StatelessWidget {
  final String hintText;
  final String label;
  final void Function(T?)? onChanged;
  final T? selectedItem;
  final Iterable<DropdownItem<T>> itens;
  final List<Widget>? icon;
  final bool showIcon;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? fillColor;
  final String? labelText;
  final bool mandatory;
  final Color? labelColor;

  const DropDownWidget({
    super.key,
    required this.hintText,
    required this.label,
    required this.onChanged,
    this.selectedItem,
    this.labelColor,
    this.itens = const [],
    this.icon,
    this.showIcon = true,
    this.validator,
    this.borderColor,
    this.labelText,
    this.mandatory = false,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != '')
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 0.5.h, left: 1.w),
                    child: TextWidget(
                      label,
                      fontWeight: FontWeight.w400,
                      textColor: labelColor ?? lightGray,
                    ),
                  ),
                ),
              ],
            ),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField<T>(
              menuMaxHeight: 30.h,
              isExpanded: true,
              decoration: InputDecoration(
                hintText: hintText,
                labelText: labelText,
                counterText: '',
                helperStyle: const TextStyle(fontSize: 10),
                errorMaxLines: 2,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontFamily: "SegoeUI",
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ),
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                border: outlineInputBorder,
                errorBorder: outlineInputBorder,
                disabledBorder: outlineInputBorder,
                focusedErrorBorder: outlineInputBorder,
                filled: true,
                fillColor: fillColor ?? lightGray.withOpacity(0.2),
              ),
              style: const TextStyle(
                color: preto,
              ),
              // validator: validator,
              iconSize: 3.h,
              value: selectedItem,
              onChanged: onChanged,
              hint: TextWidget(
                hintText,
                fontWeight: FontWeight.normal,
                textColor: lightGray,
              ),
              icon: showIcon
                  ? Row(
                      children: [
                        ...?icon,
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: preto,
                          size: 20,
                        ),
                      ],
                    )
                  : const SizedBox(),
              items: itens
                  .map(
                    (e) => DropdownMenuItem<T>(
                      value: e.id,
                      child: TextWidget(
                        e.texto,
                        textColor: preto,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          // const Text('', style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.w)),
        borderSide: BorderSide(color: borderColor ?? preto),
      );
}

class DropdownItem<T> {
  final T id;
  final String texto;

  DropdownItem({required this.id, required this.texto});
}
