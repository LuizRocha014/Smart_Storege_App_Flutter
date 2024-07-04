import 'dart:convert';
import 'dart:io';

import 'package:app_estoque/base/models/arquivo/arquivo.dart';
import 'package:app_estoque/base/models/categoria/categoria.dart';
import 'package:app_estoque/base/models/produtos/produtos.dart';
import 'package:app_estoque/base/repository/interface/iarquivo_repository.dart';
import 'package:app_estoque/base/repository/interface/iproduto_repository.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/routes.dart';
import 'package:app_estoque/utils/utils_exports.dart';
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
  late String categoriaText;
  late ImagePicker camera;
  late File? imagem;
  late RxBool mostraImagem;
  late List<String> drop;
  @override
  void iniciaControlador() {
    nomeController = TextEditingController();
    marcaController = TextEditingController();
    corController = TextEditingController();
    quantController = TextEditingController();
    valorController = TextEditingController();
    camera = ImagePicker();
    mostraImagem = false.obs;
    imagem = File("");
    drop = ["Categoria 1", "Cateogiria 2"];
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

  void cadastroProduto() async {
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

        if (imagem != null) {
          List<int> imageBytes = imagem!.readAsBytesSync();
          String base64Image = base64Encode(imageBytes);
          final arquivo = Arquivo(
              id: const Uuid().v4(),
              inclusao: DateTime.now(),
              base64: base64Image);
          instanceManager.get<IArquivoRepository>().create(arquivo.toJson());
        }
        instanceManager.get<IProdutoRepository>().create(prod.toJson());

        // ignore: use_build_context_synchronously
        context.pop();
      } else {}
    } catch (_) {}
  }
}
