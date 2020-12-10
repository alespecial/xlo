import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/stores/CriarAnuncioStore.dart';
import 'package:xlo_mobx/telas/categoria/TelaCategoria.dart';

class CategoriaField extends StatelessWidget {

  final CriarAnuncioStore criarAnuncioStore;

  CategoriaField(this.criarAnuncioStore);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        return ListTile(
          title: criarAnuncioStore.categoria == null
              ? Text(
            "Categoria *",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.grey,
                fontSize: 18
            ),
          )
          : Text(
            "Categoria *",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.grey,
                fontSize: 14
            ),
          ),
          subtitle: criarAnuncioStore.categoria != null
              ? Text(
                  "${criarAnuncioStore.categoria.descricao}",
                  style: TextStyle(color: Colors.black87, fontSize: 17),
                )
              : null,
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: () async{
            final categoria = await showDialog(context: context, builder: (_) => TelaCategoria(
              mostrarTodas: false,
              categoriaSelecionada: criarAnuncioStore.categoria)
            );
            if(categoria != null){
              criarAnuncioStore.setCategoria(categoria);
            }
          },
        );
      },
    );
  }
}
