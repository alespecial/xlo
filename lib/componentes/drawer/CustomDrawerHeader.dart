import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/models/Usuario.dart';
import 'package:xlo_mobx/stores/GerenciadorUsuarioStore.dart';
import 'package:xlo_mobx/stores/PageStore.dart';
import 'package:xlo_mobx/telas/login/TelaLogin.dart';

class CustomDrawerHeader extends StatelessWidget {

  final GerenciadorUsuarioStore gerenciadorUsuarioStore = GetIt.I<GerenciadorUsuarioStore>();

  @override
  Widget build(BuildContext context) {

    Usuario usuarioLogado = gerenciadorUsuarioStore.usuario;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();

        if(gerenciadorUsuarioStore.estaLogado){
          GetIt.I<PageStore>().setPage(4);
        }else{
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TelaLogin())
          );
        }
      },
      child: Container(
        color: Colors.purple,
        height: 95,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Icon(Icons.person, color: Colors.white, size: 35,),
            const SizedBox(width: 18,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  Text(
                    gerenciadorUsuarioStore.estaLogado
                    ? usuarioLogado.nome
                    : "Acesse sua conta agora!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    gerenciadorUsuarioStore.estaLogado
                        ? usuarioLogado.email
                        : "Clique aqui",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
