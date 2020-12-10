// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GerenciadorUsuarioStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GerenciadorUsuarioStore on _GerenciadorUsuarioStore, Store {
  Computed<bool> _$estaLogadoComputed;

  @override
  bool get estaLogado =>
      (_$estaLogadoComputed ??= Computed<bool>(() => super.estaLogado,
              name: '_GerenciadorUsuarioStore.estaLogado'))
          .value;

  final _$usuarioAtom = Atom(name: '_GerenciadorUsuarioStore.usuario');

  @override
  Usuario get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(Usuario value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$_GerenciadorUsuarioStoreActionController =
      ActionController(name: '_GerenciadorUsuarioStore');

  @override
  void setUsuario(Usuario value) {
    final _$actionInfo = _$_GerenciadorUsuarioStoreActionController.startAction(
        name: '_GerenciadorUsuarioStore.setUsuario');
    try {
      return super.setUsuario(value);
    } finally {
      _$_GerenciadorUsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
estaLogado: ${estaLogado}
    ''';
  }
}
