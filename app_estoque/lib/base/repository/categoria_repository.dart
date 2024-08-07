import 'package:app_estoque/base/models/categoria/categoria.dart';
import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/icategoria_repository.dart';

class CategoriaRepository extends BaseRepository<Categoria>
    implements ICategoriaRepository {
  CategoriaRepository(super.infosTableDatabase, super.fromJson);
}
