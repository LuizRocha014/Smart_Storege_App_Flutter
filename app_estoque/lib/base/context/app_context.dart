import 'dart:developer';

import 'package:app_estoque/base/context/context.dart';
import 'package:app_estoque/base/models/acesso/acesso.dart';
import 'package:app_estoque/base/models/user/user.dart';
import 'package:app_estoque/utils/base_migration.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

// class AppContext extends Context {
//   AppContext({
//     required super.password,
//   }) : super.nonFactoryConstructor(
//           nameDatabase: _nameDatabase,
//           version: _version,
//           tables: _tables,
//           migrations: _migrations,
//         );

// }
