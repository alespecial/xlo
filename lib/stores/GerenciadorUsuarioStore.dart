import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/Usuario.dart';
import 'package:xlo_mobx/repositorios/UsuarioRepositorio.dart';

part 'GerenciadorUsuarioStore.g.dart';

class GerenciadorUsuarioStore = _GerenciadorUsuarioStore with _$GerenciadorUsuarioStore;

abstract class _GerenciadorUsuarioStore with Store {

  _GerenciadorUsuarioStore(){
    _recuperarUsuarioLogado();
  }

  @observable
  Usuario usuario;

  @action
  void setUsuario(Usuario value) => usuario = value;

  @computed
  bool get estaLogado => usuario != null;

  Future<void> _recuperarUsuarioLogado() async{
    final usuario = await UsuarioRepositorio().carregarUsuario();
    setUsuario(usuario);
  }

}