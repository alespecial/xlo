import 'package:flutter/material.dart';

class TituloCampo extends StatelessWidget {

  TituloCampo({this.titulo, this.subTitulo});

  final String titulo;
  final String subTitulo;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$titulo   ",
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 16,
              fontWeight: FontWeight.w700
            ),
          ),
          Text(
            "$subTitulo",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
