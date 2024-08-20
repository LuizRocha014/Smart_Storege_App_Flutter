import 'package:app_estoque/base/models/produtos/produto.dart';
import 'package:app_estoque/base/repository/interface/ibase_repository.dart';

abstract class IProdutoRepository extends IBaseRepository<Produto> {
  Future<List<Produto>> getProdutos();
}
