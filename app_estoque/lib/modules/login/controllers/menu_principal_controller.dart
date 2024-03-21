import 'package:app_estoque/base/models/list_menu_Iniciar.dart';
import 'package:app_estoque/modules/shere/controllers/base_controller.dart';
import 'package:app_estoque/utils/assets.dart';

class MenuPrincipalController extends BaseController {
  
 late final List<ListOpcoesMenu> listMenuInicial;
  
  @override
  void iniciaControlador() {
    listMenuInicial = [];
    carregaDados();
  }

  void carregaDados() {
    try {
      listMenuInicial.add(ListOpcoesMenu(nome: 'Vendas', image: AssetsAplicativo.iconVendas)); 
      listMenuInicial.add(ListOpcoesMenu(nome: 'Estoque', image: AssetsAplicativo.iconEstoque)); 
      listMenuInicial.add(ListOpcoesMenu(nome: 'Produtos', image: AssetsAplicativo.iconProdutos));
      
      ;
    } catch (e) {
      return null;
    }
  }
}
