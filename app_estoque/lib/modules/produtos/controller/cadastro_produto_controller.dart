import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:app_estoque/base/models/produtos/produto.dart';
import 'package:app_estoque/base/models/smartStorege/category/category.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icategory_repository.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/routes.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:uuid/uuid.dart';

class CadastroProdutoController extends BaseController {
  final PageController pageController = PageController();
  late QrImage qrImage;
  late TextEditingController nomeController;
  late TextEditingController marcaController;
  late TextEditingController corController;
  late TextEditingController quantController;
  late TextEditingController skuController;
  late String codProduto;
  late Category? categoriaSelect;
  late RxString categoriaText;
  late ImagePicker camera;
  late File? imagem;
  late RxBool mostraImagem;
  late RxBool mostraQrCode;
  late List<Category> drop;
  late Uint8List? qrImageBytes;
  final MoneyMaskedTextController controllerValorCompra =
      MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: 'R\$ ',
  );
  final MoneyMaskedTextController controllerValorVenda =
      MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: 'R\$ ',
  );
  @override
  Future<void> iniciaControlador() async {
    nomeController = TextEditingController();
    marcaController = TextEditingController();
    corController = TextEditingController();
    quantController = TextEditingController();
    skuController = TextEditingController();
    codProduto = '';
    camera = ImagePicker();
    imagem = File("");
    mostraImagem = false.obs;
    mostraQrCode = false.obs;
    categoriaText = ''.obs;
    drop = [];
    await carregaDados();

    qrImageBytes = Uint8List(0);
  }

  Future<void> carregaDados() async {
    drop =
        await instanceManager.get<ICategoryRepository>().getAllListCategory();
  }

  String? get categoriaNomeString => categoriaText.value;

  Future<String?> validaCampos() async {
    try {
      if (nomeController.text.isEmpty) return "Insira o nome do Produto";
      if (marcaController.text.isEmpty) return "Insira a marca do Produto";
      if (corController.text.isEmpty) return "Insira a cor do Produto";
      if (quantController.text.isEmpty) return "Insira a quantidade do Produto";
      if (controllerValorVenda.text.isEmpty) return "Insira o valor do Produto";
      if (categoriaSelect == null) return "Insira a categoria do Produto";

      return null;
    } catch (e) {
      log(e.toString());
      return "";
    }
  }

  void geraQrCode(String valor) async {
    await startBarcodeScanStream(context);
    final qrCode = QrCode.fromData(
      data: valor,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    final qrImage = QrImage(qrCode);
    final qrImageByte = await qrImage.toImageAsBytes(
      size: 512,
      format: ImageByteFormat.png,
      decoration: const PrettyQrDecoration(),
    );
    qrImageBytes = qrImageByte!.buffer
        .asUint8List(qrImageByte.offsetInBytes, qrImageByte.lengthInBytes);
    mostraQrCode = true.obs;
  }

  void selectCategoria(String value) {
    try {
      categoriaSelect = drop.firstWhere((e) => e.id == value);
      // categoriaText.value = categoriaSelect!.nome;
    } catch (_) {}
  }

  void tiraFoto(ImageSource source) async {
    try {
      final file = await camera.pickImage(source: source);
      if (file != null) {
        imagem = File(file.path);
        mostraImagem = true.obs;
      }
    } catch (_) {}
  }

  void cadastroProduto() async {
    try {
      if (await validaCampos() == null) {
        final prod = Produto(
          name: nomeController.text,
          id: const Uuid().v4(),
          createdAt: DateTime.now(),
          brand: marcaController.text,
          codProd: codProduto,
          additionalInfo: null,
          description: null,
          expiryDate: null,
          minimumAmount: 0,
          numbProduct: 0,
          sku: skuController.text,
          storageLocation: usuario!.roleId,
          supplierId: 0,
          totalAmount: int.parse(quantController.text),
          categoriaId: categoriaSelect!.id,
          purchasePrice: double.parse(controllerValorCompra.text
              .replaceAll('R', '')
              .replaceAll('\$', '')
              .replaceAll('.', '')
              .replaceAll(',', '')),
          salePrice: double.parse(
            controllerValorVenda.text
                .replaceAll('R', '')
                .replaceAll('\$', '')
                .replaceAll('.', '')
                .replaceAll(',', ''),
          ),
          active: true,
        );
        // late Arquivo? arq;
        // if (imagem!.path.isNotEmpty) {
        //   List<int> imageBytes = imagem!.readAsBytesSync();
        //   String base64Image = base64Encode(imageBytes);
        //   arq = Arquivo(
        //       id: const Uuid().v4(),
        //       createdAt: DateTime.now(),
        //       base64: base64Image);

        //   //instanceManager.get<IArquivoRepository>().create(arq.toJson());
        // }
        // ignore: use_build_context_synchronously
        context.pop();
      } else {}
    } catch (_) {}
  }
}
