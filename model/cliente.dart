import 'conta.dart';

class Cliente {
  int? cpf;
  String? nome;
  String? _senha;
  Conta? conta;

  Cliente({this.cpf, this.nome, String? senha, int? tipoConta}) {
    this.conta =
        tipoConta == 0 ? Poupanca(titular: nome) : Corrente(titular: nome);
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
