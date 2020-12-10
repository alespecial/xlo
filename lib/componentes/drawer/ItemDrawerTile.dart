import 'package:flutter/material.dart';

class ItemDrawerTile extends StatelessWidget {

  ItemDrawerTile({this.label, this.iconData, this.onTap, this.estaSelecionado});

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool estaSelecionado;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: estaSelecionado ? Colors.purple : Colors.black54
        ),
      ),
      leading: Icon(
        iconData,
        color: estaSelecionado ? Colors.purple : Colors.black54,
      ),
      onTap: onTap,

    );
  }

}
