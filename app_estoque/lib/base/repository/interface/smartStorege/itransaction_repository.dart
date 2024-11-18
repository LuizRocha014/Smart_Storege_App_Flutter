import 'package:componentes_lr/componentes_lr.dart';
import '../../../models/smartStorege/Transaction/transaction.dart';

abstract class ITransactionRepository extends IBaseRepository<Transactions> {
  Future<List<Transactions>> getItensAsync();
}
