import 'package:app_estoque/base/models/smartStorege/File/file.dart';
import 'package:componentes_lr/componentes_lr.dart';

abstract class IFileRepository extends IBaseRepository {
  Future<List<FileIMG>> getItensSync();
}
