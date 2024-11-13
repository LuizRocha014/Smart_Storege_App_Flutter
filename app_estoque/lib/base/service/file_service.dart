import 'package:app_estoque/base/models/smartStorege/File/file.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ifile_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/ifile_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class FileService extends BaseService implements IFileService {
  @override
  Future<bool> postMethod() async {
    try {
      final repository = instanceManager.get<IFileRepository>();
      final list = await repository.getItensSync();
      final listMap = list.map((e) => e.toJson()).toList();
      if (list.isEmpty) return false;
      final String urlApi = "$url/api/File/PostAll";
      post(
        urlApi,
        listMap,
      ).then((retorno) {
        if (!temErroRequisicao(retorno)) {
          // e.sync = true;
          // repository.createOrReplace(e.toJson());
        }
      });
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<List<FileIMG>> getAll({bool alteracaoNula = false}) async {
    try {
      List<FileIMG> list = [];
      final repository = instanceManager.get<IFileRepository>();
      final String urlApi = "$url/api/File/GetAll";
      final retorno = await get(urlApi, query: {});
      if (retorno.body == null) return [];
      var category = (retorno.body as List).map((e) => FileIMG.fromJson(e));
      list.addAll(category);
      await repository.createList(list.map((e) => e.toJson()));
      return list;
    } catch (_) {
      return [];
    }
  }
}
