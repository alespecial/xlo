import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class codigosBasicos {

  /*
  await Parse().initialize(
  'xYoaABjPiul2tMrAOSah8hT4vg5rMUWihdee5WSs',
  'https://parseapi.back4app.com/',
  clientKey: 'yfD3ODshVf5w08Ms2SjahaAxoSqu8AlBPfYWBcdH',
  autoSendSessionId: true,
  debug: true
  );

  //Salvar dados no parse
  /*
  final categoria = ParseObject("Categorias")
    ..set<String>("Titulo", "Meias")
    ..set<int>("Position", 1);

  final response = await categoria.save();

  print(response.success);
  */

  //Atualizar dados no parse
  /*
  final categoria = ParseObject("Categorias")
    ..objectId = "5wITnx21CR"
  ..set<int>("Position", 3);

  final response = await categoria.save();

  print(response.success);
   */

  //Remover dados no parse
  /*
  final categoria = ParseObject("Categorias")
    ..objectId = "5wITnx21CR";

  categoria.delete();
   */

  //Recuperar dados especifico
  /*
  final response = await ParseObject("Categorias").getObject("ELoMFCTTPe");

  if(response.success){
    print(response.result);
  }
   */

  //Recuperar todos os dados de uma classe
  /*
  final response = await ParseObject("Categorias").getAll();
  if(response.success){
    for(final object in response.result){
      print(object);
    }
  }
   */

  final query = QueryBuilder(ParseObject("Categorias"));

  query.whereContains("Titulo", "Blusa");
  query.whereEqualTo("Position", 3);

  final response = await query.query();

  if(response.success){
  print(response.result);
  }


   */

}