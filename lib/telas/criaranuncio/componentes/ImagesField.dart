import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/stores/CriarAnuncioStore.dart';
import 'package:xlo_mobx/telas/criaranuncio/componentes/ImageSourceModal.dart';

import 'ImageDialog.dart';

class ImagesField extends StatelessWidget {

  final CriarAnuncioStore criarAnuncioStore;

  ImagesField(this.criarAnuncioStore);

  @override
  Widget build(BuildContext context) {

    ObservableList listaImagens =criarAnuncioStore.imagens;

    void onImagmSelecionada(File imagem){
      criarAnuncioStore.imagens.add(imagem);
      Navigator.of(context).pop();
    }

    return Container(
      color: Colors.grey[200],
      height: 120,
      child: Observer(
        builder: (_){
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listaImagens.length < 5
            //colocar no máximo 5 imagens
                ? listaImagens.length + 1
                : listaImagens.length,
            itemBuilder: (context, index){
              if(index == listaImagens.length) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, index == listaImagens.length ? 8 : 0 , 8),
                  child: GestureDetector(
                    onTap: (){
                      if(Platform.isAndroid){
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => ImageSourceModal(onImagmSelecionada)
                        );
                      } else{
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => ImageSourceModal(onImagmSelecionada)
                        );
                      }
                    },
                    child: CircleAvatar(
                      radius: 44,
                      backgroundColor: Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 44,
                            color: Colors.white,
                          ),
                          Text(
                            "inserir",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }else{
                return Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, index == listaImagens.length - 1 ? 8 : 0 , 8),
                  child: GestureDetector(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (_) => ImageDialog(
                            imagem: listaImagens[index],
                            onDelete: (){
                              listaImagens.removeAt(index);
                            }
                          )
                      );
                    },
                    child: CircleAvatar(
                      radius: 44,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: FileImage(listaImagens[index]),
                    ),
                  ),
                );
              }

            },
          );
        },
      ),
    );
  }
}
