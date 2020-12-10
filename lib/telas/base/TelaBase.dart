import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/stores/PageStore.dart';
import 'package:xlo_mobx/telas/criaranuncio/TelaCriarAnuncio.dart';
import 'package:xlo_mobx/telas/home/TelaHome.dart';

class TelaBase extends StatefulWidget {

  @override
  _TelaBaseState createState() => _TelaBaseState();
}

class _TelaBaseState extends State<TelaBase> {
  final PageController pageController = PageController();

  //Pegar page store do main (mesma instancia)
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();

    //Ficar observando o page no mobx
    reaction(
            (_) => pageStore.page,
            (page) => pageController.jumpToPage(page) //efeito que é chamado quando tem uma alteração
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(), //bloquear o arrastra pro lado
        children: [
          TelaHome(),
          TelaCriarAnuncio(),
          Container(color: Colors.lightBlueAccent,),
          Container(color: Colors.orangeAccent,),
          Container(color: Colors.purple,),
        ],
      ),
    );
  }
}
