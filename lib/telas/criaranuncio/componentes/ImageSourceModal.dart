import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {

  final Function(File) onImagemSelecionada;

  ImageSourceModal(this.onImagemSelecionada);

  @override
  Widget build(BuildContext context) {

    if(Platform.isAndroid){
      return BottomSheet(
          onClosing: (){},
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlatButton(
                child: const Text(
                  "Câmera",
                  style: TextStyle(color: Colors.black87),
                ),
                onPressed: getFromCamera,
              ),
              FlatButton(
                child: const Text(
                  "Galeria", style: TextStyle(color: Colors.black87),
                ),
                onPressed: getFromGaleria,
              ),
            ],
          )
      );
    }else{
      //é ios
      return CupertinoActionSheet(
        title: const Text("Selecionar foto para o anúncio"),
        //message: const Text("Escolha a origem da foto"),
        cancelButton: CupertinoActionSheetAction(
          child: const Text("Cancelar", style: TextStyle(color: Colors.red),),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        actions: [
          CupertinoActionSheetAction(
            child: const Text(
              "Câmera",
            ),
            onPressed: getFromCamera,
          ),
          CupertinoActionSheetAction(
            child: const Text(
              "Galeria",
            ),
            onPressed: getFromGaleria,
          )
        ],
      );
    }
  }

  Future<void> getFromCamera() async{

    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    if(pickedFile != null){
      final imagem = File(pickedFile.path);
      imagemSelecionada(imagem);
    }

  }

  Future<void> getFromGaleria() async{

    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    final imagem = File(pickedFile.path);

    if(pickedFile != null){
      final imagem = File(pickedFile.path);
      imagemSelecionada(imagem);
    }

  }

  void imagemSelecionada(File imagem) async{
    final croppedFile = await ImageCropper.cropImage(
      sourcePath: imagem.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: "Editar Imagem",
          toolbarColor: Colors.purple,
          toolbarWidgetColor: Colors.white),
      iosUiSettings: IOSUiSettings(
          title: "Editar Imagem",
          cancelButtonTitle: "Cancelar",
          doneButtonTitle: "Concluir"),
    );
    if(croppedFile != null)
    onImagemSelecionada(croppedFile);
  }
}
