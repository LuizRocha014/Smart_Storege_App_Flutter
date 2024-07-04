import 'package:app_estoque/base/models/acesso/acesso.dart';
import 'package:app_estoque/base/models/arquivo/arquivo.dart';
import 'package:app_estoque/base/models/produtos/produtos.dart';
import 'package:app_estoque/base/repository/acesso_repository.dart';
import 'package:app_estoque/base/repository/arquivo_repository.dart';
import 'package:app_estoque/base/repository/interface/iarquivo_repository.dart';
import 'package:app_estoque/base/repository/produto_repository.dart';
import 'package:app_estoque/base/repository/interface/iacesso_repository.dart';
import 'package:app_estoque/base/repository/interface/iproduto_repository.dart';
import 'package:app_estoque/base/service/interface/iuser_service.dart';
import 'package:app_estoque/base/service/user_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';

void initInstances() {
  try {
    instanceManager.registerLazySingleton<IUserService>(() => UserService());
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
    instanceManager.registerLazySingleton<IArquivoRepository>(
      () => ArquivoRepository(
        Arquivo.table,
        Arquivo.fromJson,
      ),
    );
  } catch (_) {}
}
