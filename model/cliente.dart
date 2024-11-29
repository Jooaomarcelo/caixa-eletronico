import 'conta.dart';

class Cliente {
  String? cpf;
  String? nome;
  String? _senha;
  Conta? conta;

  Cliente({this.cpf, this.nome, String? senha, int? conta, double? limite}) {
    if (conta == 1)
      this.conta = Poupanca(titular: nome);
    else {
      this.conta = Corrente(titular: nome);
    }
    this._senha = senha;
  }

  // Validação de senha para proteger o atributo _senha
  bool validarSenha(String senha) {
    return _senha == senha;
  }

  @override
  String toString() {
    String info = '';
    info += 'Nome: $nome\n';
    info += conta.toString();
    return info;
  }
}
