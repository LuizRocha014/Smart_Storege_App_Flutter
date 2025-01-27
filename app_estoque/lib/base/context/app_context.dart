import 'package:app_estoque/base/context/context.dart';
import 'package:app_estoque/base/models/smartStorege/File/file.dart';
import 'package:app_estoque/base/models/smartStorege/ProductFile/product_file.dart';
import 'package:app_estoque/base/models/smartStorege/Shop/shop.dart';
import 'package:app_estoque/base/models/smartStorege/ShopProduct/shop_product.dart';
import 'package:app_estoque/base/models/smartStorege/ShopUser/shop_user.dart';
import 'package:app_estoque/base/models/smartStorege/category/category.dart';
import 'package:app_estoque/base/models/smartStorege/permission/permission.dart';
import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/models/smartStorege/user/user.dart';
import 'package:app_estoque/base/models/smartStorege/userPermission/user_permission.dart';
import 'package:app_estoque/utils/base_migration.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';

class AppContext extends Context {
  AppContext()
      : super.nonFactoryConstructor(
          nameDatabase: _nameDatabase,
          version: _version,
          tables: _tables,
          migrations: _migrations,
        );
  static String get _nameDatabase => "App_estoque";
  static int get _version => 1;
  static List<InfosTableDatabase> get _tables => [
        User.table,
        UserPermission.table,
        Permission.table,
        Category.table,
        Product.table,
        ShopUser.table,
        ShopProduct.table,
        Shop.table,
        FileIMG.table,
        ProductFile.table
      ];

  static List<BaseMigration> get _migrations => [];
  // AppContext._();
  // static final AppContext instance = AppContext._();

  // static Database? _database;

  // Future<Database> get database async {
  //   if (_database != null) return _database!;

  //   _database = await _initDatabase();
  //   return _database!;
  // }

  // Future<Database> _initDatabase() async {
  //   return await openDatabase(
  //     join(await getDatabasesPath(), "App_estoque.db"),
  //     version: 1,
  //     onCreate: _onCreate,
  //   );
  // }

  // _onCreate(db, versao) async {
  //   await db.execute(Acessos.table.createTable);
  //   await db.execute(Produto.table.createTable);
  // }

  // Future<void> insertOrReplace<T>(String tableName, T item) async {
  //   final db = await instance.database;
  //   await db.insert(
  //     tableName,
  //     item as Map<String, Object?>, // Certifique-se de que o item pode ser convertido em Map<String, dynamic>
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }
}
