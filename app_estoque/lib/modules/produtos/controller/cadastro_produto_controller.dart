import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:app_estoque/base/models/smartStorege/File/file.dart';
import 'package:app_estoque/base/models/smartStorege/ProductFile/product_file.dart';
import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/models/smartStorege/category/category.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icategory_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ifile_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_file_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_repository.dart';
import 'package:app_estoque/base/service/interface/iproduct_service.dart';
import 'package:app_estoque/modules/estoque/controller/estoque_produto_controller.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/infos_statica.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:uuid/uuid.dart';

class CadastroProdutoController extends BaseController {
  final PageController pageController = PageController();
  late QrImage qrImage;
  late Product? product;
  late TextEditingController nomeController;
  late TextEditingController marcaController;
  late TextEditingController corController;
  late TextEditingController quantController;
  late TextEditingController skuController;
  late TextEditingController controllerValorCompra;
  late TextEditingController controllerValorVenda;
  late RxString codProduto;
  late Category? categoriaSelect;
  late RxString categoriaText;
  late ImagePicker camera;
  late File? imagem;
  late RxBool mostraImagem;
  late RxBool mostraQrCode;
  late RxList<Category> drop;
  late Uint8List? qrImageBytes;

  CadastroProdutoController(this.product);

  @override
  Future<void> iniciaControlador() async {
    nomeController = TextEditingController(
        text: product != null ? product!.description : "");
    marcaController =
        TextEditingController(text: product != null ? product!.brand : "");

    quantController = TextEditingController(
        text: product != null
            ? product!.quantity.toString().replaceAll((".0"), "")
            : "");
    skuController =
        TextEditingController(text: product != null ? product!.sku : "");
    controllerValorCompra = TextEditingController(
        text: product != null ? product!.purchasePrice.toString() : "");
    controllerValorVenda = TextEditingController(
        text: product != null ? product!.price.toString() : "");
    codProduto =
        RxString(product != null ? product!.codProduct.toString() : "");
    camera = ImagePicker();
    imagem = File("");
    mostraImagem = product != null
        ? product!.base64Image.isNullOrEmpty
            ? false.obs
            : true.obs
        : false.obs;
    mostraQrCode = false.obs;
    categoriaText = RxString(product != null ? product!.categoriaName! : '');
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
    codProduto.value = qrCode.toString();
    final qrImage = QrImage(qrCode);
    final qrImageByte = await qrImage.toImageAsBytes(
      size: 512,
      format: ImageByteFormat.png,
      decoration: const PrettyQrDecoration(),
    );
    qrImageBytes = qrImageByte!.buffer
        .asUint8List(qrImageByte.offsetInBytes, qrImageByte.lengthInBytes);
    mostraQrCode.value = true;
    mostraQrCode.refresh();
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
        mostraImagem.value = true;
        mostraImagem.refresh();
      }
    } catch (_) {}
  }

  void cadastroProduto() async {
    try {
      isLoading = true;
      if (product != null) {
        product!.description = nomeController.text;
        product!.brand = marcaController.text;
        product!.codProduct = codProduto.value;
        product!.sku = skuController.text;
        product!.quantity = int.parse(quantController.text);
        product!.purchasePrice = double.parse(
          controllerValorCompra.text
              .replaceAll('R', '')
              .replaceAll('\$', '')
              .replaceAll('.', '')
              .replaceAll(',', ''),
        );
        product!.price = double.parse(
          controllerValorVenda.text
              .replaceAll('R', '')
              .replaceAll('\$', '')
              .replaceAll('.', '')
              .replaceAll(',', ''),
        );
        if (!product!.fileId.isNullOrEmpty) {
          final file = await instanceManager
              .get<IFileRepository>()
              .getById(product!.fileId!);
          file!.base64Arquiv = imagem!.path.isNotEmpty
              ? base64Encode(imagem!.readAsBytesSync())
              : product!.base64Image!;
          await instanceManager
              .get<IFileRepository>()
              .createOrReplace(product!.toJson());
        } else if (product!.fileId == null && imagem!.path.isNotEmpty) {
          final base64 = base64Encode(imagem!.readAsBytesSync());
          final img = FileIMG(
              id: const Uuid().v4(),
              createdAt: DateTime.now(),
              active: true,
              fileName: 'ImagemProduto',
              base64Arquiv: base64,
              sync: false);
          final producIMG = ProductFile(
              id: const Uuid().v4(),
              createdAt: DateTime.now(),
              active: true,
              productId: product!.id,
              fileId: img.id,
              sync: false,
              description: '');
          await instanceManager
              .get<IFileRepository>()
              .createOrReplace(img.toJson());
          await instanceManager
              .get<IProductFileRepository>()
              .createOrReplace(producIMG.toJson());
        }
        await instanceManager
            .get<IProductRepository>()
            .createOrReplace(product!.toJson());
        await instanceManager.get<IProductService>().updateItem(product!);
      } else {
        final prodID = const Uuid().v4();
        if (mostraImagem.value) {
          final base64 = base64Encode(imagem!.readAsBytesSync());
          final img = FileIMG(
              id: const Uuid().v4(),
              createdAt: DateTime.now(),
              active: true,
              fileName: 'ImagemProduto',
              base64Arquiv: base64,
              sync: false);
          final producIMG = ProductFile(
              id: const Uuid().v4(),
              createdAt: DateTime.now(),
              active: true,
              productId: prodID,
              fileId: img.id,
              sync: false,
              description: '');
          await instanceManager
              .get<IFileRepository>()
              .createOrReplace(img.toJson());
          await instanceManager
              .get<IProductFileRepository>()
              .createOrReplace(producIMG.toJson());
        }
        final prod = Product(
          description: nomeController.text,
          id: prodID,
          createdAt: DateTime.now(),
          brand: marcaController.text,
          codProduct: codProduto.value,
          additionalInfo: "",
          expiryDate: null,
          minimumAmount: 0,
          sync: false,
          storedlocation: shopUser.id,
          numbProduct: 0,
          sku: skuController.text,
          supplierId: null,
          quantity: int.parse(quantController.text),
          categoryId: categoriaSelect!.id,
          purchasePrice: double.parse(
            controllerValorCompra.text
                .replaceAll('R', '')
                .replaceAll('\$', '')
                .replaceAll('.', '')
                .replaceAll(',', ''),
          ),
          price: double.parse(
            controllerValorVenda.text
                .replaceAll('R', '')
                .replaceAll('\$', '')
                .replaceAll('.', '')
                .replaceAll(',', ''),
          ),
          active: true,
          shopId: shopUser.id,
        );
        await instanceManager
            .get<IProductRepository>()
            .createOrReplace(prod.toJson());
      }
      instanceManager.get<EstoqueProdutoController>().carregaDados();
      // ignore: use_build_context_synchronously
      context.pop();
    } catch (_) {
    } finally {
      isLoading = false;
    }
  }

  void validaCodBarras() async {
    geraQrCode(codProduto.value);
    codProduto.refresh();
  }
}
