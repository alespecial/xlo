import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo_mobx/models/Cidade.dart';
import 'package:xlo_mobx/models/UF.dart';

class IBGERepositorio {

  Future<List<UF>> getUFList()  async{
    final preferences = await SharedPreferences.getInstance();

    //verifica se os dados já estão salvos no shared preferences
    if(preferences.containsKey("UF_LIST")){
      //recuperar lista deuf do shared preferences
      final js = json.decode(preferences.get("UF_LIST"));

      final ufList = js.map<UF>((json) => UF.fromJson(json)).toList();
      //Colocar em ordem alfabetica
      ufList.sort((UF a, UF b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));

      return ufList;
    }
    const endpoint = "https://servicodados.ibge.gov.br/api/v1/localidades/estados";

    try{

      final response =  await Dio().get<List>(endpoint);

      //armazenas lista no shared preferences
      preferences.setString("UF_LIST", json.encode(response.data));

      final ufList = response.data.map<UF>((json) => UF.fromJson(json)).toList();
      //Colocar em ordem alfabetica
      ufList.sort((UF a, UF b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));


      return ufList;

    } on DioError{
      return Future.error("Falha ao obter lista de Estados");
    }

  }

  Future<List<Cidade>> getCityListFromApi(UF uf) async{
    String idEstado = uf.id.toString();
    final String endpoint =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados/$idEstado/municipios";

    try{
      final response =  await Dio().get<List>(endpoint);

      final listaCidades = response.data.map<Cidade>((json) => Cidade.fromJson(json)).toList();
      //Colocar em ordem alfabetica
      listaCidades.sort((a, b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));

      return listaCidades;
    } on DioError {
      return Future.error("Falha ao obter lista de cidades");
    }
  }

}