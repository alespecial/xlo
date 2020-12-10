import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extensoes.dart';
import 'package:xlo_mobx/models/Usuario.dart';
import 'package:xlo_mobx/repositorios/UsuarioRepositorio.dart';

import 'GerenciadorUsuarioStore.dart';

part 'CadastroStore.g.dart';

class CadastroStore = _CadastroStore with _$CadastroStore;

abstract class _CadastroStore with Store {

  @observable
  String nome;

  @action
  void setName(String value) => nome = value;

  @computed
  bool get nomeValido => nome != null && nome.length > 3;
  String get nomeError {
    if(nome == null || nomeValido){
      return null;
    }else if(nome.isEmpty){
      return "Campo obrigatório!";
    }else{
      return "Nome muito curto!";
    }
  }

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValido => email != null && email.emailEValido();
  String get emailError {
    if(email == null || emailValido){
      return null;
    }else if(email.isEmpty){
      return "Campo obrigatório!";
    }else{
      return "E-mail inválido!";
    }
  }

  @observable
  String telefone;

  @action
  void setTelefone(String value) => telefone = value;

  @computed
  bool get telefoneValido => telefone != null && telefone.length >= 14;
  String get telefoneError {
    if(telefone == null || telefoneValido){
      return null;
    }else if(telefone.isEmpty){
      return "Campo obrigatório";
    }else{
      return "Celular inválido";
    }
  }

  @observable
  String senha1;

  @action
  void setSenha1(String value) => senha1 = value;

  @computed
  bool get senha1Valida => senha1 != null && senha1.length >= 6;
  String get senha1Error{
    if(senha1 == null || senha1Valida) {
      return null;
    }else if(senha1.isEmpty) {
      return "Campo obrigatório";
    }else {
      return "Senha muito curta";
    }
  }

  @observable
  String senha2;

  @action
  void setSenha2(String value) => senha2 = value;

  @computed
  bool get senha2Valida => senha2 != null && senha2.length >= 6 && senha2 == senha1;
  String get senha2Error{
    if(senha2 == null || senha2Valida) {
      return null;
    }else if(senha2.isEmpty) {
      return "Campo obrigatório";
    }else {
      return "Senhas não coincidem";
    }
  }

  @computed
  bool get formularioEValido => nomeValido && emailValido && telefoneValido
      && senha1Valida && senha2Valida;

  @computed
  Function get btnCadastrarPressionado => (formularioEValido && !carregando) ? _cadastrar : null;

  @observable
  bool carregando = false;

  @observable
  String error;

  @computed
  String get getErro => error;

  @action
  Future<void> _cadastrar() async{
    carregando = true;

    final Usuario usuario = Usuario(
      nome: nome,
      email: email,
      telefone: telefone,
      senha: senha1
    );

    try{
      final resultUsuario = await UsuarioRepositorio().cadastrar(usuario);
      //Salvar usuário no gerenciador para recuperar em qualquer lugar do app
      GetIt.I<GerenciadorUsuarioStore>().setUsuario(resultUsuario);
    } catch (e){
      print("erro chamado" + e);
      error = e;
    }


    carregando = false;
  }


}