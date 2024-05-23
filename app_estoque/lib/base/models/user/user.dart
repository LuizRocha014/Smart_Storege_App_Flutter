import 'package:app_estoque/base/models/core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';

class User extends Core {
  final String nome;
  final String sobrenome;
  final String userName;
  final String senha;
  final String email;

  User(
      {required this.sobrenome,
      required this.userName,
      required this.senha,
      required this.email,
      required this.nome,
      required super.id,
      required super.inclusao});

  factory User.fromJson(Map<String, dynamic> json) => User(
        nome: json['nome'],
        inclusao: DateTime.parse(json['inclusao']),
        id: json['id'],
        sobrenome: json['sobrenome'],
        userName: json['userName'],
        senha: json['senha'],
        email: json['email'],
      );
  static InfosTableDatabase get table {
    final columns = {
      "Nome": "TEXT",
      "Sobrenome": "TEXT",
      "UserName": "TEXT",
      "Senha": "TEXT",
      "Email": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'User', columns: columns);
  }
}
