// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CepStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CepStore on _CepStore, Store {
  Computed<String> _$clearCepComputed;

  @override
  String get clearCep => (_$clearCepComputed ??=
          Computed<String>(() => super.clearCep, name: '_CepStore.clearCep'))
      .value;

  final _$cepAtom = Atom(name: '_CepStore.cep');

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  final _$_CepStoreActionController = ActionController(name: '_CepStore');

  @override
  void setCep(String value) {
    final _$actionInfo =
        _$_CepStoreActionController.startAction(name: '_CepStore.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_CepStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cep: ${cep},
clearCep: ${clearCep}
    ''';
  }
}
