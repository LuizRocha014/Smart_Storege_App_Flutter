import 'package:app_estoque/base/models/acesso/acesso.dart';
import 'package:app_estoque/base/models/produtos.dart';
import 'package:app_estoque/base/repository/acesso_repository.dart';
import 'package:app_estoque/base/repository/produto_repository.dart';
import 'package:app_estoque/base/repository/service/iacesso_repository.dart';
import 'package:app_estoque/base/repository/service/iproduto_repository.dart';
import 'package:app_estoque/utils/utils_exports.dart';

void initInstances() {
  try {
    //  instanceManager.registerLazySingleton<IUserAprService>(() => UserAprService());
    instanceManager.registerLazySingleton<IAcessoRepository>(
      () => AcessoRepository(
        Acessos.table,
        Acessos.fromJson,
      ),
    );
    instanceManager.registerLazySingleton<IProdutoRepository>(
      () => ProdutoRepository(
        Produto.table,
        Produto.fromJson,
      ),
    );
  } catch (_) {}
}
