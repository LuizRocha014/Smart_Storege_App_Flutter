import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class BaseMigration {
  final List<String> migrations;
  final List<FutureOr<Function>> migrationsFunctions;
  final int version;
  BaseMigration(this.migrations, this.version,
      {this.migrationsFunctions = const []});
  Future<void> executaMigrations(Database database) async {
    for (final migration in migrations) {
      try {
        await database.execute(migration);
      } catch (e) {
        if (kDebugMode) {
          log(
            "Erro ao executar ALTER TABLE\nO Script $migration falhou: $e",
            name: "LOG - Erro Ocorrido",
          );
        }
      }
    }
    for (final migration in migrationsFunctions) {
      try {
        await (migration as Function()).call();
      } catch (e) {
        if (kDebugMode) {
          log(
            "Erro ao executar migration function\nO Script $migration falhou: $e",
            name: "LOG - Erro Ocorrido",
          );
        }
      }
    }
  }
}
