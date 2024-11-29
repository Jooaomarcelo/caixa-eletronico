import 'dart:io';
import 'controlador_cliente.dart';

class ControladorCaixa {
  final _ctrlCliente = ControladorCliente();

  void iniciarAtendimento() {
    while (true) {
      print('\n\n\n---- Bem-vindo ao Banco Asimov -----\n');
      print('1. Login');
      print('2. Cadastro');
      print('3. Sair');
      stdout.write('Escolha uma opção: ');
      String? opcao = stdin.readLineSync();

      switch (opcao) {
        case '1':
          _login();
          break;
        case '2':
          _cadastro();
          break;
        case '3':
          print(
              '\nMuito obrigado por utilizar nossos serviços!\nVolte sempre!');
          return;
        default:
          print('Opção inválida');
      }
    }
  }

  void _login() {
    stdout.write('Informe seu CPF: ');
    int? cpf = int.tryParse(stdin.readLineSync()!);
    stdout.write('Informe sua senha: ');
    String? senha = stdin.readLineSync();
    print('\nAutenticando...');

    final cliente = _ctrlCliente.autenticarCliente(cpf: cpf, senha: senha!);
    if (cliente != null) {
      _menuCliente(cliente);
    }
  }

  void _cadastro() {
    // cpf, nome, senha, conta
    stdout.write('Informe seu CPF (Ex: 12345678910): ');
    int? cpf = int.tryParse(stdin.readLineSync()!);
    stdout.write('Informe seu nome: ');

    // Correção de nome
    String? tempNome = stdin.readLineSync();

    String? nome = int.tryParse(tempNome!) == null ? tempNome : '';
    stdout.write('Informe sua senha: ');
    String? senha = stdin.readLineSync();
    stdout.write('Informe o tipo de conta (0 - Poupança | 1 - Corrente): ');
    int? tipoConta = int.tryParse(stdin.readLineSync()!);

    _ctrlCliente.cadastrarCliente(
        cpf: cpf, nome: nome, senha: senha!, tipoConta: tipoConta);
  }

  _menuCliente(var cliente) {
    while (true) {
      print('\n\n\n---- Bem-vindo, ${cliente.nome} -----\n');
      print('1. Informações da conta');
      print('2. Saque');
      print('3. Depósito');
      print('4. Sair');
      stdout.write('Escolha uma opção: ');
      String? opcao = stdin.readLineSync();
      print(''); // Pular linha

      switch (opcao) {
        case '1':
          print('----------------------------\n');
          print(cliente);
          print('\nPressione uma tecla para voltar: ');
          stdin.readLineSync();
          break;
        case '2':
          stdout.write('Informe o valor do saque: ');
          double? valor = double.tryParse(stdin.readLineSync()!);
          cliente.conta!.saque(valor!);
          print(''); // Pular linha
          break;
        case '3':
          stdout.write('Informe o valor do depósito: ');
          double? valor = double.tryParse(stdin.readLineSync()!);
          cliente.conta!.depositar(valor!);
          print(''); // Pular linha
          break;
        case '4':
          return;
        default:
          print('Opção inválida');
      }
    }
  }
}
