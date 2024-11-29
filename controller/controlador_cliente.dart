import '../model/cliente.dart';

class ControladorCliente {
  final List<Cliente> clientes = [
    Cliente(cpf: 12345678910, nome: 'Fulano', senha: '123456', conta: 0),
  ];

  void cadastrarCliente(
      {int? cpf, String? nome, String senha = '', int? conta}) {
    // Validando campos
    if (cpf == null || nome == null || senha.isEmpty || conta == null) {
      print('\nCampos não podem estar vazios.');
      return;
    }

    // Validando CPF
    if (cpf < 10000000000 || cpf > 99999999999) {
      print('\nCPF inválido.');
      return;
    }

    // Validando nome
    if (nome.isEmpty) {
      print('\nNome inválido.');
      return;
    }

    // Validando conta
    if (conta < 0 || conta > 1) {
      print('\nTipo de conta inválido.');
      return;
    }

    //Fim da validação dos campos

    // Novo cliente
    var cliente = Cliente(cpf: cpf, nome: nome, senha: senha);

    // Lista não vazia e CPF já cadastrado
    if (!clientes.isEmpty && (clientes.any((cliente) => cliente.cpf == cpf))) {
      print('\nCPF já cadastrado.');
      return;
    }

    // Adicionando cliente
    clientes.add(cliente);
    print('\nCliente cadastrado com sucesso!');
    return;
  }

  Cliente? autenticarCliente({int? cpf, String senha = ''}) {
    // Validando campos
    if (cpf == null || senha.isEmpty) {
      print('\nCampos não podem estar vazios.');
      return null;
    }

    // Cliente não cadastrado
    if (!clientes.any((c) => c.cpf == cpf)) {
      print('\nCliente não cadastrado.');
      return null;
    }

    // Cliente cadastrado
    var cliente = clientes.firstWhere((c) => c.cpf == cpf);

    // Senha incorreta
    if (!cliente.validarSenha(senha)) {
      print('\nUsuário ou senha incorreta.');
      return null;
    }

    // Senha correta
    return cliente;
  }
}
