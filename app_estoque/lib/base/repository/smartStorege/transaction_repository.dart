import 'package:app_estoque/base/models/smartStorege/Transaction/transaction.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/itransaction_repository.dart';

class TransactionRepository extends BaseRepository<Transactions>
    implements ITransactionRepository {
  TransactionRepository(super.infosTableDatabase, super.fromJson);

  @override
  Future<List<Transactions>> getItensAsync() async {
    try {
      final query =
          '''SELECT * FROM ${Transactions.table.tableName} WHERE Sync = 0''';
      final entity = await context.rawQuery(query);
      if (entity.isEmpty) return [];
      final entityList = entity.map((e) => Transactions.fromJson(e)).toList();
      return entityList;
    } catch (_) {
      return [];
    }
  }
}
