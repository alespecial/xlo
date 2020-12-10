import 'package:flutter/material.dart';

class Botao extends StatelessWidget {

  String text;
  Color corBackground;
  Color corTexto;
  VoidCallback onPressed;
  bool carregando;


  Botao({this.text = "ENTRAR", this.corBackground = Colors.orange,
    this.corTexto = Colors.white, @required this.onPressed, this.carregando = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40, //altura do botão
        margin: const EdgeInsets.only(top: 22, bottom: 18),
        child: RaisedButton(
          color: corBackground,
          disabledColor: Colors.orange.withAlpha(120),
          child: carregando
              ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),)
              : Text(text),
          textColor: corTexto,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20) //borda
          ),
          onPressed: onPressed,
        ),
      );
  }
}
