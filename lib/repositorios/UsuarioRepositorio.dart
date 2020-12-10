import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/models/Usuario.dart';
import 'package:xlo_mobx/repositorios/ChavesTabelas.dart';
import 'package:xlo_mobx/repositorios/parse_erros.dart';
import 'package:xlo_mobx/stores/CadastroStore.dart';

class UsuarioRepositorio {

  CadastroStore cadastroStore;

  Future<Usuario> logarComEmail(String email, String senha) async{

    final parseUsuario = ParseUser(
      email,
      senha,
      email
    );

    final response = await parseUsuario.login();

    if(response.success){
      return mapParseToUser(response.result);
    }else{
      return Future.error(
        ParseErrors.getDescription(response.error.code),
      );
    }

  }

  Future<Usuario> cadastrar(Usuario usuario) async{

    final parseUsuario = ParseUser(
      //parse utiliza o usuario para login, por isso colocar o email no lugar do usuario
        usuario.email,
        usuario.senha,
        usuario.email
    );
    
    parseUsuario.set<String>(keyNomeUsuario, usuario.nome);
    parseUsuario.set<String>(keyTelefoneUsuario, usuario.telefone);
    parseUsuario.set(keyTipoUsuario, usuario.tipoUsuario.index);

    final response = await parseUsuario.signUp();

    if(response.success){
      return mapParseToUser(response.result);
      //print(response.result);
    }else{
      return Future.error(
          ParseErrors.getDescription(response.error.code),
      );
    }

  }
  
  Future<Usuario> carregarUsuario() async{
    final parseUser = await ParseUser.currentUser();
    if(parseUser != null){
      //verificar se token ainda é válido
      final response = await ParseUser
          .getCurrentUserFromServer(parseUser.sessionToken);
      if(response.success){
        //se for válido retorna o usuário
        return mapParseToUser(response.result);
      }else{
        //se não, remove ele da mémoria
        await parseUser.logout();
      }
    }
    return null;
  }

  Usuario mapParseToUser(ParseUser parseUser){
    return Usuario(
      idUsuario: parseUser.objectId,
      nome: parseUser.get(keyNomeUsuario),
      email: parseUser.get(keyEmailUsuario),
      telefone: parseUser.get(keyTelefoneUsuario),
      tipoUsuario: TipoUsuario.values[parseUser.get(keyTipoUsuario)],
      dataCriacao: parseUser.get(keyDataCriacao)
    );
  }

}