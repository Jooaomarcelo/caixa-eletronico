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
    }
    _saldo += valor;
    print(
        'Depósito de R\$${valor.toStringAsFixed(2)} realizado.\nSaldo atual R\$${_saldo.toStringAsFixed(2)}');
  }

  // Saque
  void saque(double valor) {
    if (_saldo - valor < 0) {
      print('Saldo insuficiente para efetuar saque!');
    }

    _saldo -= valor;
  }
}

class Poupanca extends Conta {
  double taxaDeJuros;

  Poupanca({String? titular, this.taxaDeJuros = 0}) : super(titular: titular);

  void aplicarJuros() {
    var rendimento = taxaDeJuros * _saldo;
    _saldo += rendimento;
    print(
        'Rendimento: R\$${rendimento.toStringAsFixed(2)}\nSaldo atual: R\$${_saldo.toStringAsFixed(2)}');
  }

  @override
  String toString() {
    return 'Tipo de conta: Poupança\nSaldo: R\$${_saldo.toStringAsFixed(2)}\nTaxa de juros: $taxaDeJuros';
  }
}

class Corrente extends Conta {
  double limite;

  Corrente({String? titular, this.limite = 1000}) : super(titular: titular);

  @override
  void saque(double valor) {
    if (_saldo - valor >= -limite) {
      _saldo -= valor;
    }

    print('Limite excedido!');
  }

  @override
  String toString() {
    return 'Tipo de conta: Corrente\nSaldo: R\$${_saldo.toStringAsFixed(2)}\nLimite: R\$${limite.toStringAsFixed(2)}';
  }
}
