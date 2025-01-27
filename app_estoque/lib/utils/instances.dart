import 'package:app_estoque/base/models/smartStorege/File/file.dart';
import 'package:app_estoque/base/models/smartStorege/ProductFile/product_file.dart';
import 'package:app_estoque/base/models/smartStorege/Shop/shop.dart';
import 'package:app_estoque/base/models/smartStorege/ShopProduct/shop_product.dart';
import 'package:app_estoque/base/models/smartStorege/ShopUser/shop_user.dart';
import 'package:app_estoque/base/models/smartStorege/Transaction/transaction.dart';
import 'package:app_estoque/base/models/smartStorege/category/category.dart';
import 'package:app_estoque/base/models/smartStorege/permission/permission.dart';
import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/models/smartStorege/userPermission/user_permission.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icategory_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ifile_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ipermission_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_file_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_product_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_user_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/itransaction_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iuser_permission_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/category_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/file_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/permission_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/product_file_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/product_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/shop_product_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/shop_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/shop_user_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/transaction_repository.dart';
import 'package:app_estoque/base/repository/smartStorege/user_permission_repository.dart';
import 'package:app_estoque/base/service/category_service.dart';
import 'package:app_estoque/base/service/interface/icategory_service.dart';
import 'package:app_estoque/base/service/interface/ipermission_service.dart';
import 'package:app_estoque/base/service/interface/ishop_product_service.dart';
import 'package:app_estoque/base/service/interface/ishop_service.dart';
import 'package:app_estoque/base/service/interface/ishop_user_service.dart';
import 'package:app_estoque/base/service/interface/iuser_permission_service.dart';
import 'package:app_estoque/base/service/interface/iuser_service.dart';
import 'package:app_estoque/base/service/permission_service.dart';
import 'package:app_estoque/base/service/shop_product_service.dart';
import 'package:app_estoque/base/service/shop_service.dart';
import 'package:app_estoque/base/service/shop_user_service.dart';
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
    instanceManager.registerLazySingleton<IShopService>(() => ShopService());
    instanceManager
        .registerLazySingleton<IShopProductService>(() => ShopProductService());
    instanceManager
        .registerLazySingleton<IShopUserService>(() => ShopUserService());

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
    instanceManager.registerLazySingleton<IShopUserRepository>(
      () => ShopUserRepository(
        ShopUser.table,
        ShopUser.fromJson,
      ),
    );
    instanceManager.registerLazySingleton<IShopProductRepository>(
      () => ShopProductRepository(
        ShopProduct.table,
        ShopProduct.fromJson,
      ),
    );
    instanceManager.registerLazySingleton<ITransactionRepository>(
      () => TransactionRepository(
        Transaction.table,
        Transaction.fromJson,
      ),
    );
    instanceManager.registerLazySingleton<IShopRepository>(
      () => ShopRepository(
        Shop.table,
        Shop.fromJson,
      ),
    );
    instanceManager.registerLazySingleton<IProductFileRepository>(
      () => ProductFileRepository(
        ProductFile.table,
        ProductFile.fromJson,
      ),
    );
    instanceManager.registerLazySingleton<IFileRepository>(
      () => FileRepository(
        FileIMG.table,
        FileIMG.fromJson,
      ),
    );
  } catch (_) {}
}
