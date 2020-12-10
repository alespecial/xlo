import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_mobx/componentes/drawer/CustomDrawer.dart';
import 'package:xlo_mobx/stores/CriarAnuncioStore.dart';
import 'package:xlo_mobx/widgets/CampoTexto.dart';

import 'componentes/CategoriaField.dart';
import 'componentes/CepField.dart';
import 'componentes/ImagesField.dart';

class TelaCriarAnuncio extends StatelessWidget {

  final CriarAnuncioStore criarAnuncioStore = CriarAnuncioStore();

  @override
  Widget build(BuildContext context) {

    final labelStyle = TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.grey,
        fontSize: 18
    );

    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Criar Anúncio"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          clipBehavior: Clip.antiAlias, //deixar card sempre arrendodado
          margin: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16) //borda card
          ),
          elevation: 8, //elevação do card
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //======== IMAGENS ========
              ImagesField(criarAnuncioStore),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Título *",
                  labelStyle: labelStyle,
                  contentPadding: contentPadding
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Descrição *",
                    labelStyle: labelStyle,
                    contentPadding: contentPadding
                ),
                maxLines: null,
              ),
              CategoriaField(criarAnuncioStore),
              Divider(height: 1, color: Colors.black87,),
              CepField(),
              
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Preço *",
                    labelStyle: labelStyle,
                    contentPadding: contentPadding,
                    prefixText: "R\$ ",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RealInputFormatter(centavos: true)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
