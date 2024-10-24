import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icostumer_repository.dart';

class CostumerRepository extends BaseRepository implements ICostumerRepository {
  CostumerRepository(super.infosTableDatabase, super.fromJson);
}
