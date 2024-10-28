import 'package:app_estoque/base/models/smartStorege/Transaction/transaction.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/itransaction_repository.dart';

class TransactionRepository extends BaseRepository<Transaction>
    implements ITransactionRepository {
  TransactionRepository(super.infosTableDatabase, super.fromJson);
}
