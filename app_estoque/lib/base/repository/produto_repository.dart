import 'package:app_estoque/base/models/produtos/produtos.dart';
import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/iproduto_repository.dart';

class ProdutoRepository extends BaseRepository<Produto> implements IProdutoRepository {
  ProdutoRepository(super.infosTableDatabase, super.fromJson);
}
