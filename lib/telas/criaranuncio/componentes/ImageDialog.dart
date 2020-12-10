import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {

  final dynamic imagem;
  final VoidCallback onDelete;

  ImageDialog({@required this.imagem, @required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(imagem),
          FlatButton(
            onPressed: (){
              Navigator.of(context).pop();
              onDelete();
            },
            child: const Text("Excluir"),
            textColor: Colors.red,
          )
        ],
      ),
    );
  }
}
