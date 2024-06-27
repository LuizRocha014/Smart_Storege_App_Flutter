// import 'dart:async';

// //import 'package:diacritic/diacritic.dart';
// import 'package:app_estoque/widget/dropdown_widget.dart';
// import 'package:flutter/material.dart';

// class DropDowSearchWidget<T> extends StatelessWidget {
//   final String? label;
//   final bool mandatory;
//   final String hintText;
//   final Color? textColor;
//   final bool hasBorder;
//   final Iterable<DropdownItem<T>> itens;
//   final dynamic prefixIcon;
//   final IconData? suffixIcon;
//   final T? selectedItem;
//   final String? Function(String?)? validator;
//   final FutureOr Function(T?) onChanged;
//   final TextEditingController controller;
//   final bool readOnly;
//   final bool? enabled;
//   final Color? iconColor;
//   final bool login;
//   final double? borderRadius;
//   final Color? borderColor;
//   final Color? fillColor;

//   const DropDowSearchWidget({
//     super.key,
//     required this.itens,
//     this.label,
//     this.mandatory = false,
//     required this.hintText,
//     this.textColor,
//     required this.onChanged,
//     this.validator,
//     this.selectedItem,
//     required this.controller,
//     this.readOnly = false,
//     this.enabled,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.iconColor,
//     this.login = false,
//     this.hasBorder = true,
//     this.borderRadius,
//     this.borderColor,
//     this.fillColor,
//   });

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 1.h),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (label != null)
//             Row(
//               children: [
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 0.5.h, left: 1.w),
//                     child: TextWidget(
//                       label,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//                 TextWidget(mandatory ? " *" : null, textColor: Colors.red),
//               ],
//             ),
//           SearchField<T>(
//             readOnly: readOnly,
//             enabled: enabled,
//             suggestions: itens.map((e) => SearchFieldListItem<T>(e.texto, item: e.id)).toList(),
//             textInputAction: TextInputAction.next,
//             controller: controller,
//             //hasOverlay: true,
//             searchStyle: TextStyle(
//               fontSize: smallMediumFont,
//             ),

//             onSearchTextChanged: (item) {
//               if (item.isEmpty) return [];
//               final filteredSuggestions = itens
//                   .where(
//                     (element) => removeDiacritics(element.texto.toLowerCase()).contains(
//                       removeDiacritics(item.toLowerCase()),
//                     ),
//                   )
//                   .map((e) => SearchFieldListItem(e.texto, item: e.id))
//                   .toList();
//               // controller.text = item;
//               // controller.selection = TextSelection.fromPosition(TextPosition(offset: item.length));
//               return filteredSuggestions;
//             },
//             onSuggestionTap: (value) async {
//               await onChanged(value.item);
//               FocusManager.instance.primaryFocus?.unfocus();
//             },
//             validator: validator,
//             suggestionStyle: TextStyle(fontSize: smallMediumFont),
//             maxSuggestionsInViewPort: 6,
//             itemHeight: 50,
//             suggestionItemDecoration: BoxDecoration(
//               border: Border(
//                 left: BorderSide(width: 2.w, color: white),
//                 right: BorderSide(width: 2.w, color: white),
//                 top: BorderSide(width: 1.h, color: white),
//                 bottom: BorderSide(width: 1.h, color: white),
//               ),
//             ),
//             searchInputDecoration: InputDecoration(
//               hintText: hintText,
//               counterText: '',
//               helperStyle: const TextStyle(fontSize: 10),
//               prefixIcon: prefixIcon != null
//                   ? prefixIcon is String
//                       ? ImageAsset(prefixIcon as String, height: 2.5.h, width: 2.5.h)
//                       : Icon(prefixIcon as IconData, size: 2.5.h, color: iconColor)
//                   : null,
//               // prefixIcon == null ? null : ImageAsset(prefixIcon!, height: 2.h, width: 2.w, color: azulPrimario),
//               suffixIcon: suffixIcon == null
//                   ? const SizedBox(height: 20, width: 20)
//                   : Icon(suffixIcon, color: iconColor, size: 2.5.h),
//               hintStyle: TextStyle(
//                 fontSize: smallMediumFont,
//                 fontWeight: FontWeight.normal,
//                 fontFamily: "SegoeUI",
//                 color: mediumGray,
//               ),
//               labelStyle: TextStyle(
//                 fontSize: mediumFont,
//                 fontFamily: "SegoeUI",
//               ),
//               filled: true,
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 2.w,
//                 vertical: isMobile
//                     ? login
//                         ? 2.h
//                         : 0.5
//                     : 1.5.h,
//               ),
//               fillColor: fillColor ?? white,
//               border: outlineInputBorder,
//               enabledBorder: outlineInputBorder,
//               focusedBorder: outlineInputBorder,
//               errorBorder: outlineInputBorder,
//               disabledBorder: outlineInputBorder,
//               focusedErrorBorder: outlineInputBorder,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   InputBorder get outlineInputBorder => login
//       ? UnderlineInputBorder(
//           borderSide: BorderSide(color: borderColor ?? (hasBorder ? black : transparent)),
//           borderRadius: BorderRadius.circular(borderRadius ?? 2.w),
//         )
//       : OutlineInputBorder(
//           borderSide: BorderSide(color: borderColor ?? (hasBorder ? black : transparent)),
//           borderRadius: BorderRadius.circular(borderRadius ?? 2.w),
//         );
//   // OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
//   //       borderSide: const BorderSide(color: bordaTextField),
//   //       borderRadius: BorderRadius.all(Radius.circular(2.w)),
//   //     );
// }
