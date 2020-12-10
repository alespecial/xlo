import 'package:flutter/material.dart';
import 'package:xlo_mobx/componentes/drawer/CustomDrawer.dart';

class TelaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(),
    );
  }
}
