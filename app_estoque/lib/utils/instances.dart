import 'package:app_estoque/base/models/smartStorege/category/category.dart';
import 'package:app_estoque/base/models/smartStorege/permission/permission.dart';
import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/models/smartStorege/userPermission/user_permission.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icategory_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ipermission_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iuser_permission_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/category_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/permission_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/product_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/user_permission_repository.dart';
import 'package:app_estoque/base/service/category_service.dart';
import 'package:app_estoque/base/service/interface/icategory_service.dart';
import 'package:app_estoque/base/service/interface/ipermission_service.dart';
import 'package:app_estoque/base/service/interface/iuser_permission_service.dart';
import 'package:app_estoque/base/service/interface/iuser_service.dart';
import 'package:app_estoque/base/service/permission_service.dart';
import 'package:app_estoque/base/service/user_permission_service.dart';
import 'package:app_estoque/base/service/user_service.dart';
import 'package:app_estoque/utils/synchronize.dart';
import 'package:app_estoque/utils/utils_exports.dart';

void initInstances() {
  try {
    instanceManager.registerSingleton<Synchronism>(Synchronism());

    //Service
    instanceManager.registerLazySingleton<IUserService>(() => UserService());
    instanceManager
        .registerLazySingleton<IPermissionService>(() => PermissionService());
    instanceManager.registerLazySingleton<IUserPermissionService>(
        () => UserPermissionService());
    instanceManager
        .registerLazySingleton<ICategoryService>(() => CategoryService());

    //Repository
    instanceManager.registerLazySingleton<ICategoryRepository>(
      () => CategoryRepository(
        Category.table,
        Category.fromJson,
      ),
    );
    instanceManager.registerLazySingleton<IPermissionRepository>(
      () => PermissionRepository(
        Permission.table,
        Permission.fromJson,
      ),
    );
    instanceManager.registerLazySingleton<IUserPermissionRepository>(
      () => UserPermissionRepository(
        UserPermission.table,
        UserPermission.fromJson,
      ),
    );
    instanceManager.registerLazySingleton<IProductRepository>(
      () => ProductRepository(
        Product.table,
        Product.fromJson,
      ),
    );
  } catch (_) {}
}
