import 'dart:developer';

import 'package:app_estoque/base/context/service/icontext.dart';
import 'package:app_estoque/base/repository/interface/ibase_repository.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class BaseRepository<T> implements IBaseRepository<T> {
  @override
  late final IContext context;
  @override
  late final InfosTableDatabase infosTableDatabase;
  @override
  late final T Function(Map<String, dynamic>) fromJson;

  BaseRepository(this.infosTableDatabase, this.fromJson) {
    context = instanceManager.get<IContext>();
  }
  @override
  Future<List<T>> getAll() async {
    final query = "SELECT * FROM ${infosTableDatabase.tableName}";
    final entitiesBanco = await context.rawQuery(query);
    if (entitiesBanco.isNullOrEmpty) return <T>[];
    final entities = entitiesBanco.map((e) => fromJson(e)).toList();
    return entities;
  }

  @override
  Future<T?> getById(String id) async {
    try {
      final query =
          "SELECT * FROM ${infosTableDatabase.tableName} WHERE Id = '$id' LIMIT 1";
      final entityBanco = await context.rawQuery(query);
      if (entityBanco.isEmpty) return null;
      final entity = fromJson(entityBanco.first);
      return entity;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<T?> create(Map<String, dynamic> json) async {
    final insertEntity =
        await context.insert(infosTableDatabase.tableName, json);
    if (insertEntity <= 0) throw Exception();
    final entity = await getById(json['Id'] as String);
    return entity;
  }

  @override
  Future<void> createNoReturn(Map<String, dynamic> json) async {
    final insertEntity =
        await context.insert(infosTableDatabase.tableName, json);
    if (insertEntity <= 0) throw Exception();
  }

  @override
  Future<T?> createOrReplace(Map<String, dynamic> json) async {
    try {
      final entityExists = await getById(json['Id'] as String);
      late int insertEntity;
      if (entityExists == null) {
        insertEntity = await context.insert(infosTableDatabase.tableName, json);
      } else {
        insertEntity = await context.update(infosTableDatabase.tableName, json,
            where: "Id = ?", whereArgs: [json['Id']]);
      }
      if (insertEntity <= 0) throw Exception();
      final entity = await getById(json['Id'] as String);
      return entity;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<List<T>> createList(Iterable<Map<String, dynamic>> json) async {
    final itens = <T>[];
    for (final item in json) {
      final itemCriado = await createOrReplace(item);
      if (itemCriado != null) itens.add(itemCriado);
    }
    return itens;
  }

  @override
  Future<void> createListNoReturn(Iterable<Map<String, dynamic>> json) async {
    for (final item in json) {
      await createNoReturn(item);
    }
  }

  @override
  Future<T?> update(Map<String, dynamic> json) async {
    final updateEntity = await context.update(
        infosTableDatabase.tableName, json,
        where: "Id = ?", whereArgs: [json['Id']]);
    if (updateEntity == 0) throw Exception();
    final entity = await getById(json['Id'] as String);
    return entity;
  }

  @override
  Future<bool> delete(String id) async {
    try {
      final query = "DELETE FROM ${infosTableDatabase.tableName} WHERE Id = ?";
      final deleteEntity = await context.rawDelete(query, [id]);
      if (deleteEntity == 0) throw Exception();
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> deleteAll() async {
    try {
      final query = "DELETE FROM ${infosTableDatabase.tableName}";
      await context.rawDelete(query);
      return true;
    } catch (_) {
      return false;
    }
  }
}

extension BaseRepositoryExtension on List<Map<String, Object?>>? {
  bool get isNullOrEmpty => this == null || (this?.isEmpty ?? true);
}
