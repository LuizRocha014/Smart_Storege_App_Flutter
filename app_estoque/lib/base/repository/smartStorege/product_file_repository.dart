import 'package:app_estoque/base/models/smartStorege/ProductFile/product_file.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_file_repository.dart';

class ProductFileRepository extends BaseRepository
    implements IProductFileRepository {
  ProductFileRepository(super.infosTableDatabase, super.fromJson);

  @override
  Future<List<ProductFile>> getItensSync() async {
    try {
      final query =
          '''SELECT * FROM ${ProductFile.table.tableName} WHERE Sync = 0 ''';
      final entity = await context.rawQuery(query);
      if (entity.isEmpty) return [];
      final entityList = entity.map((e) => ProductFile.fromJson(e)).toList();
      return entityList;
    } catch (_) {
      return [];
    }
  }
}
