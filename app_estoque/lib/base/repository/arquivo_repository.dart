import 'package:app_estoque/base/models/arquivo/arquivo.dart';
import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/iarquivo_repository.dart';

class ArquivoRepository extends BaseRepository<Arquivo>
    implements IArquivoRepository {
  ArquivoRepository(super.infosTableDatabase, super.fromJson);
}
