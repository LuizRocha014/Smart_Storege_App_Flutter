import 'package:app_estoque/base/models/acesso/acesso.dart';
import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/iacesso_repository.dart';

class AcessoRepository extends BaseRepository<Acessos> implements IAcessoRepository {
  AcessoRepository(super.infosTableDatabase, super.fromJson);
}
