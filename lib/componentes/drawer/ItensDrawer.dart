import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/componentes/drawer/ItemDrawerTile.dart';
import 'package:xlo_mobx/stores/PageStore.dart';

class ItensDrawer extends StatelessWidget {

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemDrawerTile(
          label: "Anúncios",
          iconData: Icons.list,
          onTap: (){
            pageStore.setPage(0);
          },
          estaSelecionado: pageStore.page == 0 ? true : false
        ),
        ItemDrawerTile(
            label: "Inserir Anúncio",
            iconData: Icons.edit,
            onTap: (){
              pageStore.setPage(1);
            },
            estaSelecionado: pageStore.page == 1 ? true : false
        ),
        ItemDrawerTile(
            label: "Chat",
            iconData: Icons.chat,
            onTap: (){
              pageStore.setPage(2);
            },
            estaSelecionado: pageStore.page == 2 ? true : false
        ),
        ItemDrawerTile(
            label: "Favoritos",
            iconData: Icons.favorite,
            onTap: (){
              pageStore.setPage(3);
            },
            estaSelecionado: pageStore.page == 3 ? true : false
        ),
        ItemDrawerTile(
            label: "Minha Conta",
            iconData: Icons.person,
            onTap: (){
              pageStore.setPage(4);
            },
            estaSelecionado: pageStore.page == 4 ? true : false
        )
      ],
    );
  }
}
