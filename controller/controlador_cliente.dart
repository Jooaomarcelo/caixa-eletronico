import '../model/cliente.dart';

class ControladorCliente {
  final List<Cliente> clientes = [];

  void cadastrarCliente(
      {String cpf = '', String nome = '', String senha = '', int? conta}) {
    // Validando campos
    if (cpf.isEmpty || nome.isEmpty || senha.isEmpty || conta == null) {
      print('Campos não podem estar vazios.');
      return;
    }
    if (conta < 0 || conta > 1) {
      print('Tipo de conta inválido.');
      return;
    }

    // Novo cliente
    var cliente = Cliente(cpf: cpf, nome: nome, senha: senha);

    // Lista não vazia e CPF já cadastrado
    if (!clientes.isEmpty && (clientes.any((cliente) => cliente.cpf == cpf))) {
      print('CPF já cadastrado.');
      return;
    }

    // Adicionando cliente
    clientes.add(cliente);
    print('Cliente cadastrado com sucesso!');
    return;
  }

  Cliente? autenticarCliente({cpf, senha}) {
    // Validando campos
    if (cpf == null || senha == null) {
      print('Campos não podem estar vazios.');
      return null;
    }

    // Cliente não cadastrado
    if (!clientes.any((c) => c.cpf == cpf)) {
      print('Cliente não cadastrado.');
      return null;
    }

    // Cliente cadastrado
    var cliente = clientes.firstWhere((c) => c.cpf == cpf);

    // Senha incorreta
    if (!cliente.validarSenha(senha)) {
      print('Usuário ou senha incorreta.');
      return null;
    }

    // Senha correta
    print(cliente);
    return cliente;
  }
}
