import 'package:flutter/material.dart';

import 'CustomDrawerHeader.dart';
import 'ItensDrawer.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Pegar altura da tela
    double alturaTela = MediaQuery.of(context).size.height;

    //Pegar largura da tela
    double larguraTela = MediaQuery.of(context).size.width;
    double larguraDrawer = larguraTela * 0.65; //65% da tela

    return SafeArea(
      child: ClipRRect( //arrendodar qualquer widget
        borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
        child: SizedBox(
          width: larguraDrawer,
          child: Drawer(
            child: ListView(
              children: [
                CustomDrawerHeader(),
                ItensDrawer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
