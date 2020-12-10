import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/models/Categoria.dart';
import 'package:xlo_mobx/stores/CategoriaStore.dart';
import 'package:xlo_mobx/widgets/ErrorBox.dart';

class TelaCategoria extends StatelessWidget {

  final Categoria categoriaSelecionada;
  final bool mostrarTodas;

  TelaCategoria({this.mostrarTodas = true, this.categoriaSelecionada});

  final CategoriaStore categoriaStore = GetIt.I<CategoriaStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias"),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          elevation: 8,
          child: Observer(
            builder: (_) {
              if(categoriaStore.error != null){
                //Deu algum erro
                return ErrorBox(
                  menssagem: categoriaStore.error,
                );
              }else if(categoriaStore.listaCategoria.isEmpty){
                //Carregando as categorias
                return Center(
                  child: CircularProgressIndicator(),
                );
              }else{
                //Recuperou as categorias com sucesso
                final categorias = mostrarTodas
                    ? categoriaStore.listaTodasCategorias
                    : categoriaStore.listaCategoria;

                return ListView.separated(
                  itemCount: categorias.length,
                  separatorBuilder: (context, index){
                    return Divider(height: 0.1, color: Colors.grey,);
                  },
                  itemBuilder: (context, index){
                    final categoria = categorias[index];
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).pop(categoria);
                      },
                      child: Container(
                        height: 50,
                        color: categoria.idCategoria == categoriaSelecionada?.idCategoria
                          ? Colors.purple.withAlpha(50)
                            : null,
                        alignment: Alignment.center,
                        child: Text(
                            categoria.descricao,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: categoria.idCategoria == categoriaSelecionada?.idCategoria
                            //verifica se o item está selecionado
                              ? FontWeight.bold
                                : null
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          )
        ),
      ),
    );
  }
}
