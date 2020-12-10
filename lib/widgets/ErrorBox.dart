import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {

  ErrorBox({this.menssagem});

  final String menssagem;

  @override
  Widget build(BuildContext context) {
    if(menssagem == null){
      print("1111");
      return Container();
    }
    print("222");

    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.red,
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(width: 16,),
          Expanded(
            child: Text(
              "Oops! ${menssagem}. ", //Por favor, tente novamente.
              style: TextStyle(
                color: Colors.white,
                fontSize: 14
              ),
            ),
          )
        ],
      ),
    );
  }
}
