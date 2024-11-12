import 'dart:convert';

import 'package:app_estoque/base/models/dto/product_dto/product_dto.dart';
import 'package:app_estoque/base/models/smartStorege/File/file.dart';
import 'package:app_estoque/base/models/smartStorege/ProductFile/product_file.dart';
import 'package:app_estoque/base/models/smartStorege/ShopProduct/shop_product.dart';
import 'package:app_estoque/base/models/smartStorege/category/category.dart';
import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_repository.dart';
import 'package:app_estoque/utils/infos_statica.dart';

class ProductRepository extends BaseRepository<Product>
    implements IProductRepository {
  ProductRepository(super.infosTableDatabase, super.fromJson);

  String _getCategoriaProdutos(
      {String selectItens = "",
      String where = "",
      groupBy = "",
      String orderBy = ""}) {
    final query = ''' SELECT $selectItens FROM ${Category.table.tableName} CT
                        JOIN ${Product.table.tableName} P ON CT.ID = P.categoryId
                        JOIN ${ShopProduct.table.tableName} SP ON SP.productId = P.ID
                        LEFT JOIN ${ProductFile.table.tableName} PDF ON PDF.productId = P.ID
                        LEFT JOIN ${FileIMG.table.tableName} F ON PDF.fileId = F.ID
                        $where 
                        $groupBy
                        $orderBy''';

    return query;
  }

  String _getCategorias() {
    final query =
        ''' SELECT ct.description as categoriaName, ct.id as categoriaId FROM ${Category.table.tableName} 
        ct order by ct.description ASC''';
    return query;
  }

  @override
  Future<List<ProdutctDto>> getProdutos() async {
    try {
      final entityCategory = await context.rawQuery(_getCategorias());
      if (entityCategory.isEmpty) return [];
      final listCategory =
          entityCategory.map((e) => ProdutctDto.fromJson(e)).toList();

      for (var element in listCategory) {
        final entity = await context.rawQuery(_getCategoriaProdutos(
          selectItens: "P.*, F.base64Arquiv as base64Image",
          where:
              " WHERE SP.USERID = '${loggerUser.id}' AND SP.SHOPID = '${shopUser.shopId}' and ct.Id = '${element.categoriaId}' ",
        ));
        if (entity.isNotEmpty) {
          final entityProdutct = element.listProduct =
              entity.map((e) => Product.fromJson(e)).toList();
          for (var prod in entityProdutct) {
            prod.image = base64Decode(prod.base64Image ?? "");
          }
        }
      }

      return listCategory;
    } catch (_) {
      return [];
    }
  }

  @override
  Future<List<Product>> getItensAsync() async {
    try {
      final query =
          '''SELECT * FROM ${Product.table.tableName} WHERE Sync = 0''';
      final entity = await context.rawQuery(query);
      if (entity.isEmpty) return [];
      final entityList = entity.map((e) => Product.fromJson(e)).toList();
      return entityList;
    } catch (_) {
      return [];
    }
  }
}
