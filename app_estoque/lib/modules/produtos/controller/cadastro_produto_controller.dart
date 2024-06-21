import 'dart:io';

import 'package:app_estoque/base/models/categoria.dart';
import 'package:app_estoque/base/models/produtos.dart';
import 'package:app_estoque/modules/produtos/controller/produto_controller.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class CadastroProdutoController extends BaseController {
  late TextEditingController nomeController;
  late TextEditingController marcaController;
  late Categoria? categoriaSelect;
  late TextEditingController corController;
  late TextEditingController quantController;
  late TextEditingController valorController;
  late ImagePicker camera;
  late File? imagem;
  final RxBool mostraImagem = false.obs;
  @override
  void iniciaControlador() {
    nomeController = TextEditingController();
    marcaController = TextEditingController();
    corController = TextEditingController();
    quantController = TextEditingController();
    valorController = TextEditingController();
    camera = ImagePicker();
  }

  Future<String?> validaCampos() async {
    try {
      if (nomeController.text.isEmpty) return "Insira o nome do Produto";
      if (marcaController.text.isEmpty) return "Insira a marca do Produto";
      if (corController.text.isEmpty) return "Insira a cor do Produto";
      if (quantController.text.isEmpty) return "Insira a quantidade do Produto";
      if (valorController.text.isEmpty) return "Insira o valor do Produto";

      return null;
    } catch (_) {
      return "";
    }
  }

  void tiraFoto(ImageSource source) async {
    try {
      final file = await camera.pickImage(source: source);
      if (file != null) {
        imagem = File(file.path);
        mostraImagem.value = true;
      }
    } catch (_) {}
  }

  void cadastroProduto(BuildContext context) async {
    try {
      if (await validaCampos() == null) {
        final prod = Produto(
            nome: nomeController.text,
            id: const Uuid().v4(),
            inclusao: DateTime.now(),
            cor: corController.text,
            marca: marcaController.text,
            codigo: "",
            quantidade: quantController.text,
            arquivoId: null,
            valor: valorController.text);
        // Get.put(ProdutoRepository())
        //     .db
        //     .insert(Produto.table.tableName, prod.toJson());
        Get.find<ProdutoController>().produtos.add(prod);
        // ignore: use_build_context_synchronously
        navigator?.pop(context);
      } else {}
    } catch (_) {}
  }
}
