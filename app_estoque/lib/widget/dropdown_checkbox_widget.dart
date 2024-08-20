import 'package:app_estoque/utils/app_measurements.dart';
import 'package:app_estoque/utils/cores_do_aplicativo.dart';
import 'package:app_estoque/utils/fonts.dart';
import 'package:app_estoque/widget/text_widget.dart';
import 'package:flutter/material.dart';

class DropDownCheckBoxWidget<T> extends StatefulWidget {
  final String label;
  final String? hintText;
  final Color? checkboxColor;
  final Color? externalLabelColor;
  final void Function(T?, bool)? onChanged;
  final Iterable<DropdownSelectItem<T>> itens;
  final bool mandatory;
  final Color? borderColor;
  final String? Function(T?)? validator;
  final String? labelText;
  final AutovalidateMode? autovalidateMode;

  const DropDownCheckBoxWidget({
    super.key,
    required this.label,
    required this.onChanged,
    required this.itens,
    this.externalLabelColor,
    this.checkboxColor,
    this.hintText,
    this.mandatory = false,
    this.borderColor,
    this.validator,
    this.labelText,
    this.autovalidateMode = AutovalidateMode.always,
  });

  @override
  State<DropDownCheckBoxWidget<T>> createState() =>
      _DropDownCheckBoxWidgetState<T>();
}

class _DropDownCheckBoxWidgetState<T> extends State<DropDownCheckBoxWidget<T>> {
  GlobalKey? dropdownKey = GlobalKey();
  List<DropdownSelectItem<T>> get selectedItens =>
      widget.itens.where((element) => element.isSelected).toList();

  @override
  void initState() {
    super.initState();
  }

  //Método que altera a lista de selecionas, o booleano do item, chama o onChanged do widget e atualiza o texto com setState
  void changeIsSelectedItem(bool selected, DropdownSelectItem<T> item) {
    if (!selectedItens.contains(item) && selected) {
      selectedItens.add(item);
    } else {
      selectedItens.remove(item);
    }
    item.isSelected = selected;
    widget.onChanged?.call(item.id, selected);
    setState(() {});
  }

  //Método usado para abrir o dropdown ao clicar no container que está na frente do dropdown pelo stack
  void openDropdown() {
    GestureDetector? detector;
    void searchForGestureDetector(BuildContext? element) {
      element?.visitChildElements((element) {
        if (element.widget is GestureDetector) {
          detector = element.widget as GestureDetector?;
        } else {
          searchForGestureDetector(element);
        }
      });
    }

    searchForGestureDetector(dropdownKey?.currentContext);
    assert(detector != null);

    detector?.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Label de informação do dropdown
        Row(
          children: [
            Visibility(
              visible: !widget.label.isNotEmpty,
              child: Flexible(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0.5.h, left: 1.w),
                  child: TextWidget(
                    widget.label,
                    fontWeight: FontWeight.w600,
                    textColor: widget.externalLabelColor,
                    fontSize: FontesDoAplicativo.font_16,
                  ),
                ),
              ),
            ),
            const TextWidget("Teste", textColor: Colors.red),
          ],
        ),
        //Stack pra fazer o texto dos selecionados ficar em cima do dropdown
        Stack(
          alignment: Alignment.center,
          children: [
            DropdownButtonHideUnderline(
              key: dropdownKey,
              child: DropdownButtonFormField<T>(
                menuMaxHeight: 30.h,
                autovalidateMode: widget.autovalidateMode,
                icon: const Icon(Icons.keyboard_arrow_down,
                    color: CoresDoAplicativo.gray),
                dropdownColor: Colors.white,
                value: selectedItens.isNotEmpty ? selectedItens[0].id : null,
                validator: widget.validator,
                onChanged: (value) {},
                elevation: 0,
                style: const TextStyle(
                  color: Colors.black,
                ),
                // hint: TextWidget(
                //   //widget.hintText,
                //   //overflow: TextOverflow.ellipsis,
                //   fontSize: FontesDoAplicativo.font_16,
                //   textColor: CoresDoAplicativo.gray,
                //   fontWeight: FontWeight.normal,
                //   //fontFamily: "SegoeUI",
                // ),
                decoration: InputDecoration(
                  counterText: '',
                  helperStyle: TextStyle(
                      fontSize: FontesDoAplicativo.font_18,
                      color: CoresDoAplicativo.gray),
                  errorMaxLines: 2,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    // vertical: isMobile ? 0.5.h : 1.5.h,
                  ),
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  border: outlineInputBorder,
                  errorBorder: outlineInputBorder,
                  disabledBorder: outlineInputBorder,
                  focusedErrorBorder: outlineInputBorder,
                  filled: true,
                  //fillColor: white,
                ),
                //Usado pra deixar o texto do dropdown vazio após selecionar um item
                selectedItemBuilder: (context) => widget.itens
                    .map(
                      (e) => DropdownMenuItem(
                        child: Container(),
                      ),
                    )
                    .toList(),
                items: widget.itens
                    .map(
                      (e) => DropdownMenuItem<T>(
                        value: e.id,
                        //Desabilita o item fazendo ele não ser clicável pelo dropdown em si
                        enabled: false,
                        child: StatefulBuilder(
                          builder: (context, setStateSb) {
                            //Método para alteração da cor do checkbox de acordo com o booleano
                            Color getColor(Set<WidgetState> states) {
                              if (e.isSelected) {
                                return widget.checkboxColor ??
                                    CoresDoAplicativo.preto;
                              }
                              return CoresDoAplicativo.branco;
                            }

                            //Recria o tap do item dentro do item no menu
                            return GestureDetector(
                              onTap: () {
                                changeIsSelectedItem(!e.isSelected, e);
                                setStateSb(() {});
                              },
                              child: Container(
                                color: CoresDoAplicativo.branco,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: e.isSelected,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.comfortable,
                                      checkColor: CoresDoAplicativo.branco,
                                      fillColor: WidgetStateColor.resolveWith(
                                          getColor),
                                      onChanged: (value) {
                                        changeIsSelectedItem(value!, e);
                                        setStateSb(() {});
                                      },
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.text,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            //Indicação de itens selecionados que vai ficar em cima do dropdown
            if (selectedItens.isNotEmpty)
              //Align center pra centralizar o texto
              Padding(
                padding: EdgeInsets.fromLTRB(2.w, 1.5.h, 8.w, 4.h),
                child: GestureDetector(
                  onTap: () => openDropdown(),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextWidget(
                      selectedItens.isNotEmpty
                          ? selectedItens.map((e) => e.text).join('; ')
                          : "",
                      //overflow: TextOverflow.ellipsis,
                      fontSize: FontesDoAplicativo.font_18,
                      textColor: selectedItens.isNotEmpty
                          ? CoresDoAplicativo.preto
                          : CoresDoAplicativo.gray,
                    ),
                  ),
                ),
              ),
          ],
        ),
        //Funciona como helperText, usado apenas pro tamanho
        Text(
          " ",
          style: Theme.of(context).inputDecorationTheme.helperStyle,
        ),
      ],
    );
  }

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderSide:
            BorderSide(color: widget.borderColor ?? CoresDoAplicativo.preto),
        borderRadius: BorderRadius.all(Radius.circular(2.w)),
      );
}

//Abstração do objeto pra poder funcionar pra qualquer classe
class DropdownSelectItem<T> {
  final T id;
  final String text;
  late bool isSelected;

  DropdownSelectItem(
      {required this.id, required this.text, this.isSelected = false});
}
