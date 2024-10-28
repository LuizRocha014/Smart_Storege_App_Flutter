import 'package:componentes_lr/componentes_lr.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ifile_repository.dart';

class FileRepository extends BaseRepository implements IFileRepository {
  FileRepository(super.infosTableDatabase, super.fromJson);
}
