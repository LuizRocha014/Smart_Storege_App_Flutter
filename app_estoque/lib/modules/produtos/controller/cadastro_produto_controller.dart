import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:app_estoque/base/models/smartStorege/File/file.dart';
import 'package:app_estoque/base/models/smartStorege/ProductFile/product_file.dart';
import 'package:app_estoque/base/models/smartStorege/ShopProduct/shop_product.dart';
import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/models/smartStorege/category/category.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icategory_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ifile_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_file_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_product_repository.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/routes.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:uuid/uuid.dart';
import 'package:app_estoque/utils/infos_statica.dart' as sai;

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
  late RxList<Category> drop;
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
    drop = RxList();
    await carregaDados();

    qrImageBytes = Uint8List(0);
  }

  Future<void> carregaDados() async {
    drop.value =
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
      final prodID = const Uuid().v4();
      if (mostraImagem.value) {
        final base64 = base64Encode(imagem!.readAsBytesSync());
        final img = FileIMG(
            id: const Uuid().v4(),
            createdAt: DateTime.now(),
            active: true,
            fileName: 'ImagemProduto',
            base64Arquiv: base64);
        final producIMG = ProductFile(
            id: const Uuid().v4(),
            createdAt: DateTime.now(),
            active: true,
            productId: prodID,
            fileId: img.id,
            description: '');
        await instanceManager
            .get<IFileRepository>()
            .createOrReplace(img.toJson());
        await instanceManager
            .get<IProductFileRepository>()
            .createOrReplace(producIMG.toJson());
      }
      final prod = Product(
        name: nomeController.text,
        id: prodID,
        createdAt: DateTime.now(),
        brand: marcaController.text,
        codProd: codProduto,
        additionalInfo: null,
        description: null,
        expiryDate: null,
        minimumAmount: 0,
        numbProduct: 0,
        sku: skuController.text,
        storageLocation: sai.loggerUser.roleId,
        supplierId: 0,
        totalAmount: int.parse(quantController.text),
        categoriaId: categoriaSelect!.id,
        purchasePrice: double.parse(
          controllerValorCompra.text
              .replaceAll('R', '')
              .replaceAll('\$', '')
              .replaceAll('.', '')
              .replaceAll(',', ''),
        ),
        salePrice: double.parse(
          controllerValorVenda.text
              .replaceAll('R', '')
              .replaceAll('\$', '')
              .replaceAll('.', '')
              .replaceAll(',', ''),
        ),
        active: true,
      );
      final shopProduct = ShopProduct(
          id: const Uuid().v4(),
          createdAt: DateTime.now(),
          active: true,
          productId: prod.id,
          shopId: sai.shopUser.shopId,
          userId: sai.loggerUser.id,
          totalAmount: int.parse(quantController.text),
          salePrice: prod.salePrice!);
      await instanceManager
          .get<IProductRepository>()
          .createOrReplace(prod.toJson());
      await instanceManager
          .get<IShopProductRepository>()
          .createOrReplace(shopProduct.toJson());
      // ignore: use_build_context_synchronously
      context.pop();
    } catch (_) {}
  }
}
