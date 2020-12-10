// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LogarStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LogarStore on _LogarStore, Store {
  Computed<bool> _$emailValidoComputed;

  @override
  bool get emailValido =>
      (_$emailValidoComputed ??= Computed<bool>(() => super.emailValido,
              name: '_LogarStore.emailValido'))
          .value;
  Computed<bool> _$senhaValidaComputed;

  @override
  bool get senhaValida =>
      (_$senhaValidaComputed ??= Computed<bool>(() => super.senhaValida,
              name: '_LogarStore.senhaValida'))
          .value;
  Computed<Function> _$btnLogarPressionadoComputed;

  @override
  Function get btnLogarPressionado => (_$btnLogarPressionadoComputed ??=
          Computed<Function>(() => super.btnLogarPressionado,
              name: '_LogarStore.btnLogarPressionado'))
      .value;

  final _$emailAtom = Atom(name: '_LogarStore.email');

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

  final _$senhaAtom = Atom(name: '_LogarStore.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_LogarStore.carregando');

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

  final _$errorAtom = Atom(name: '_LogarStore.error');

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

  final _$_logarAsyncAction = AsyncAction('_LogarStore._logar');

  @override
  Future<void> _logar() {
    return _$_logarAsyncAction.run(() => super._logar());
  }

  final _$_LogarStoreActionController = ActionController(name: '_LogarStore');

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_LogarStoreActionController.startAction(name: '_LogarStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LogarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo =
        _$_LogarStoreActionController.startAction(name: '_LogarStore.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_LogarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
carregando: ${carregando},
error: ${error},
emailValido: ${emailValido},
senhaValida: ${senhaValida},
btnLogarPressionado: ${btnLogarPressionado}
    ''';
  }
}
