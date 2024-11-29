class Conta {
  String? titular;
  double _saldo = 0;

  Conta({this.titular});

  // Getter
  double get saldo => _saldo;

  // Depósito
  void depositar(double valor) {
    if (valor < 0) {
      print('Valor de depósito inválido!');
      return;
    }
    _saldo += valor;
    print(
        'Depósito de R\$${valor.toStringAsFixed(2)} realizado.\nSaldo atual R\$${_saldo.toStringAsFixed(2)}');
  }

  // Saque
  void saque(double valor) {
    if (_saldo - valor < 0) {
      print('Saldo insuficiente para efetuar saque!');
      return;
    }

    _saldo -= valor;
    print(
        'Saque de R\$${valor.toStringAsFixed(2)} realizado.\nSaldo atual R\$${_saldo.toStringAsFixed(2)}');
  }
}

class Poupanca extends Conta {
  double _taxaDeJuros = 0.1;

  Poupanca({String? titular}) : super(titular: titular);

  double _aplicarJuros() {
    return _taxaDeJuros * _saldo;
  }

  void saque(double valor) {
    if (_saldo + _aplicarJuros() - valor < 0) {
      print('Saldo insuficiente para efetuar saque!');
      return;
    }

    _saldo += _aplicarJuros() - valor;
    print(
        'Saque de R\$${valor.toStringAsFixed(2)} realizado.\nSaldo atual R\$${_saldo.toStringAsFixed(2)}');
  }

  @override
  String toString() {
    return 'Tipo de conta: Poupança\nSaldo: R\$${(_saldo + _aplicarJuros()).toStringAsFixed(2)}\nTaxa de juros: $_taxaDeJuros';
  }
}

class Corrente extends Conta {
  double _limite = 4000;

  Corrente({String? titular}) : super(titular: titular);

  @override
  void saque(double valor) {
    if (_saldo - valor < -_limite) {
      print('Limite excedido!');
      return;
    }

    _saldo -= valor;
    print(
        'Saque de R\$${valor.toStringAsFixed(2)} realizado.\nSaldo atual R\$${_saldo.toStringAsFixed(2)}');
  }

  @override
  String toString() {
    return 'Tipo de conta: Corrente\nSaldo: R\$${_saldo.toStringAsFixed(2)}\nLimite: R\$${_limite.toStringAsFixed(2)}';
  }
}
