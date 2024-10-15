import 'package:app_estoque/base/models/smartStorege/Transaction/transaction.dart';
import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/itransaction_repository.dart';

class TransactionRepository extends BaseRepository<Transaction>
    implements ITransactionRepository {
  TransactionRepository(super.infosTableDatabase, super.fromJson);
}
