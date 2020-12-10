import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extensoes.dart';
import 'package:xlo_mobx/repositorios/UsuarioRepositorio.dart';

import 'GerenciadorUsuarioStore.dart';

part 'LogarStore.g.dart';

class LogarStore = _LogarStore with _$LogarStore;

abstract class _LogarStore with Store {

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValido => email != null && email.emailEValido();
  String get emailError =>
      email == null || emailValido ? null : "E-mail inválido!";

  @observable
  String senha;

  @action
  void setSenha(String value) => senha = value;

  @computed
  bool get senhaValida => senha != null && senha.length > 4;
  String get senhaError =>
      senha == null || senhaValida ? null : "Senha inválida!";

  @computed
  Function get btnLogarPressionado => emailValido && senhaValida && !carregando
      ? _logar : null;

  @observable
  bool carregando = false;

  @observable
  String error;

  @action
  Future<void> _logar() async{

    carregando = true;

    try{
      final usuario = await UsuarioRepositorio().logarComEmail(email, senha);
      //Salvar usuário no gerenciador para recuperar em qualquer lugar do app
      GetIt.I<GerenciadorUsuarioStore>().setUsuario(usuario);
    }catch (e){
      error = e;
    }


    carregando = false;

  }

}