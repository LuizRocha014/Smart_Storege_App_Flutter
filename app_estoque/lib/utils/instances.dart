import 'package:app_estoque/base/models/smartStorege/category/category.dart';
import 'package:app_estoque/base/models/smartStorege/permission/permission.dart';
import 'package:app_estoque/base/repository/acesso_repository.dart';
import 'package:app_estoque/base/repository/interface/iacesso_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icategory_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/category_repository.dart';
import 'package:app_estoque/base/service/category_service.dart';
import 'package:app_estoque/base/service/interface/icategory_service.dart';
import 'package:app_estoque/base/service/interface/iuser_service.dart';
import 'package:app_estoque/base/service/user_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';

void initInstances() {
  try {
    instanceManager.registerLazySingleton<IUserService>(() => UserService());
    instanceManager
        .registerLazySingleton<ICategoryService>(() => CategoryService());
    instanceManager.registerLazySingleton<IAcessoRepository>(
      () => AcessoRepository(
        Permission.table,
        Permission.fromJson,
      ),
    );
    instanceManager.registerLazySingleton<ICategoryRepository>(
      () => CategoryRepository(
        Category.table,
        Category.fromJson,
      ),
    );
    // instanceManager.registerLazySingleton<IProdutoRepository>(
    //   () => ProdutoRepository(
    //     Produto.table,
    //     Produto.fromJson,
    //   ),
    // );
    // instanceManager.registerLazySingleton<IArquivoRepository>(
    //   () => ArquivoRepository(
    //     Arquivo.table,
    //     Arquivo.fromJson,
    //   ),
    // );
    // instanceManager.registerLazySingleton<ICategoriaRepository>(
    //   () => CategoriaRepository(
    //     Categoria.table,
    //     Categoria.fromJson,
    //   ),
    // );
  } catch (_) {}
}
