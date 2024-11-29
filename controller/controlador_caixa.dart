import 'dart:io';
import 'controlador_cliente.dart';

class ControladorCaixa {
  final _ctrlCliente = ControladorCliente();

  void iniciarAtendimento() {
    while (true) {
      print('1. Login');
      print('2. Cadastro');
      print('3. Sair');
      stdout.write('Escolha uma opção: ');
      String? opcao = stdin.readLineSync();

      switch (opcao) {
        case '1':
          _login();
          break;
        case 2:
          _cadastro();
          break;
        case '3':
          print('Muito obrigado por utilizar nossos serviços!\nVolte sempre!');
          return;
        default:
          print('Opção inválida');
      }
    }
  }
}
