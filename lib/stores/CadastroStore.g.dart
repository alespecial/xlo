// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CadastroStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroStore on _CadastroStore, Store {
  Computed<bool> _$nomeValidoComputed;

  @override
  bool get nomeValido =>
      (_$nomeValidoComputed ??= Computed<bool>(() => super.nomeValido,
              name: '_CadastroStore.nomeValido'))
          .value;
  Computed<bool> _$emailValidoComputed;

  @override
  bool get emailValido =>
      (_$emailValidoComputed ??= Computed<bool>(() => super.emailValido,
              name: '_CadastroStore.emailValido'))
          .value;
  Computed<bool> _$telefoneValidoComputed;

  @override
  bool get telefoneValido =>
      (_$telefoneValidoComputed ??= Computed<bool>(() => super.telefoneValido,
              name: '_CadastroStore.telefoneValido'))
          .value;
  Computed<bool> _$senha1ValidaComputed;

  @override
  bool get senha1Valida =>
      (_$senha1ValidaComputed ??= Computed<bool>(() => super.senha1Valida,
              name: '_CadastroStore.senha1Valida'))
          .value;
  Computed<bool> _$senha2ValidaComputed;

  @override
  bool get senha2Valida =>
      (_$senha2ValidaComputed ??= Computed<bool>(() => super.senha2Valida,
              name: '_CadastroStore.senha2Valida'))
          .value;
  Computed<bool> _$formularioEValidoComputed;

  @override
  bool get formularioEValido => (_$formularioEValidoComputed ??= Computed<bool>(
          () => super.formularioEValido,
          name: '_CadastroStore.formularioEValido'))
      .value;
  Computed<Function> _$btnCadastrarPressionadoComputed;

  @override
  Function get btnCadastrarPressionado => (_$btnCadastrarPressionadoComputed ??=
          Computed<Function>(() => super.btnCadastrarPressionado,
              name: '_CadastroStore.btnCadastrarPressionado'))
      .value;
  Computed<String> _$getErroComputed;

  @override
  String get getErro => (_$getErroComputed ??=
          Computed<String>(() => super.getErro, name: '_CadastroStore.getErro'))
      .value;

  final _$nomeAtom = Atom(name: '_CadastroStore.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$emailAtom = Atom(name: '_CadastroStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$telefoneAtom = Atom(name: '_CadastroStore.telefone');

  @override
  String get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  final _$senha1Atom = Atom(name: '_CadastroStore.senha1');

  @override
  String get senha1 {
    _$senha1Atom.reportRead();
    return super.senha1;
  }

  @override
  set senha1(String value) {
    _$senha1Atom.reportWrite(value, super.senha1, () {
      super.senha1 = value;
    });
  }

  final _$senha2Atom = Atom(name: '_CadastroStore.senha2');

  @override
  String get senha2 {
    _$senha2Atom.reportRead();
    return super.senha2;
  }

  @override
  set senha2(String value) {
    _$senha2Atom.reportWrite(value, super.senha2, () {
      super.senha2 = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_CadastroStore.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$errorAtom = Atom(name: '_CadastroStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_cadastrarAsyncAction = AsyncAction('_CadastroStore._cadastrar');

  @override
  Future<void> _cadastrar() {
    return _$_cadastrarAsyncAction.run(() => super._cadastrar());
  }

  final _$_CadastroStoreActionController =
      ActionController(name: '_CadastroStore');

  @override
  void setName(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setTelefone');
    try {
      return super.setTelefone(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha1(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setSenha1');
    try {
      return super.setSenha1(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha2(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setSenha2');
    try {
      return super.setSenha2(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
email: ${email},
telefone: ${telefone},
senha1: ${senha1},
senha2: ${senha2},
carregando: ${carregando},
error: ${error},
nomeValido: ${nomeValido},
emailValido: ${emailValido},
telefoneValido: ${telefoneValido},
senha1Valida: ${senha1Valida},
senha2Valida: ${senha2Valida},
formularioEValido: ${formularioEValido},
btnCadastrarPressionado: ${btnCadastrarPressionado},
getErro: ${getErro}
    ''';
  }
}
