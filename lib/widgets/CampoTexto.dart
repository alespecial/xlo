import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {

  TextInputType textInputType;

  CampoTexto(this.textInputType);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          isDense: true
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
