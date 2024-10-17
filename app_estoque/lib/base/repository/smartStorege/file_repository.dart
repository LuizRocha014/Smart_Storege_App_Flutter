import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ifile_repository.dart';

class FileRepository extends BaseRepository implements IFileRepository {
  FileRepository(super.infosTableDatabase, super.fromJson);
}
