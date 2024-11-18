import 'package:app_estoque/base/models/smartStorege/Transaction/transaction.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/itransaction_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/itransaction_service.dart.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class TransactionService extends BaseService implements ITransactionService {
  @override
  Future<bool> postMethod() async {
    try {
      final repository = instanceManager.get<ITransactionRepository>();
      final list = await repository.getItensAsync();
      if (list.isEmpty) return false;
      final listMap = list.map((e) => e.toJson()).toList();
      final String urlApi = "$url/api/Transaction/PostAll";
      post(
        urlApi,
        listMap,
      ).then((retorno) {
        if (!temErroRequisicao(retorno)) {}
      });

      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<List<Transactions>> getAll({bool alteracaoNula = false}) async {
    try {
      final repository = instanceManager.get<ITransactionRepository>();
      final String urlApi = "$url/api/Transaction/GetAll";
      final retorno = await get(urlApi, query: {});
      if (retorno.body == null) return [];
      var list =
          (retorno.body as List).map((e) => Transactions.fromJson(e)).toList();
      await repository.createList(list.map((e) => e.toJson()));
      return list;
    } catch (_) {
      return [];
    }
  }
}
