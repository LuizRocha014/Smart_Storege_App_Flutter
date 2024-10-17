import 'package:app_estoque/base/models/smartStorege/File/file.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ifile_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/ifile_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class FileService extends BaseService implements IFileService {
  @override
  Future<List<FileIMG>> getAll() async {
    try {
      List<FileIMG> list = [];
      final repository = instanceManager.get<IFileRepository>();
      final String urlApi = "$url/api/Category/GetAll";
      final retorno = await get(urlApi, query: {});
      if (retorno.body == null) return throw Expando();
      var category = (retorno.body as List).map((e) => FileIMG.fromJson(e));
      list.addAll(category);
      await repository.createList(list.map((e) => e.toJson()));
      return list;
    } catch (_) {
      return [];
    }
  }
}
