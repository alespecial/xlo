import 'package:dio/dio.dart';
import 'package:xlo_mobx/models/Cidade.dart';
import 'package:xlo_mobx/models/Endereco.dart';
import 'package:xlo_mobx/models/UF.dart';
import 'package:xlo_mobx/repositorios/IbgeRepositorio.dart';

class CepRepositorio {

  Future<Endereco> getAddressFromApi(String cep) async{
    //recuperar endereço

    if(cep == null || cep.isEmpty){
      return Future.error("CEP Inválido");
    }

    //substituir qualquer caractere que não sejá número por vazio
    final clearCep = cep.replaceAll(RegExp("[^0-9]"), "");

    if(clearCep.length != 8){
      return Future.error("CEP Inválido");
    }


    final endPoint = "https://viacep.com.br/ws/$clearCep/json";

    try{
      final response = await Dio().get<Map>(endPoint);

      if(response.data.containsKey("erro") && response.data["erro"]){
        return Future.error("CEP Inválido (não existe)");
      }

      final listaUf = await IBGERepositorio().getUFList();

      return Endereco(
          cep: response.data["cep"],
          bairro: response.data["bairro"],
          cidade: Cidade(nome: response.data["localidade"]),
          uf: listaUf.firstWhere((uf) => uf.iniciais == response.data["uf"])
      );
    }catch (e) {
      return Future.error("Falhar ao buscar CEP");
    }
  }



}