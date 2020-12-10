import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/stores/CepStore.dart';

class CepField extends StatelessWidget {

  final CepStore cepStore = CepStore();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: cepStore.setCep,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          decoration: InputDecoration(
            labelText: "CEP *",
            labelStyle: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.grey,
              fontSize: 18
            ),
            contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
          ),
        ),
        Observer(builder: (_) {
          if(cepStore.endereco == null && cepStore.error == null && !cepStore.carregando){
            print("1");
            return Container();
          }else if(cepStore.endereco == null && cepStore.error == null && cepStore.carregando){
            print("2");
            return LinearProgressIndicator();
          }else if(cepStore.error != null){
            print("3");
            return Container(
              color: Colors.red.withAlpha(100),
              height: 50,
              padding: const EdgeInsets.all(8),
              child: Text(
                cepStore.error,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.red
                ),
              ),
            );
          }else{
            print("4");
            final endereco = cepStore.endereco;
            return Container(
              color: Colors.purple.withAlpha(150),
              height: 50,
              padding: const EdgeInsets.all(8),
              child: Text(
                "Localização: ${endereco.bairro}, ${endereco.cidade.nome} - ${endereco.uf.iniciais}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
              ),
            );
          }
        }),
      ],
    );
  }
}
