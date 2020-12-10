import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/models/Categoria.dart';
import 'package:xlo_mobx/repositorios/ChavesTabelas.dart';
import 'package:xlo_mobx/repositorios/parse_erros.dart';

class CategoriaRepositorio {

  Future<List<Categoria>> getList() async{
    //recuperar categorias do parse server
    final queryBuilder = QueryBuilder(ParseObject(keyTabelaCategoria));
    //trazer todas as categorias em ordem alfabetica
    queryBuilder.orderByAscending(keyDescricaoCategoria);

    final response = await queryBuilder.query();

    if(response.success){
      return response.results.map((parseObject) => Categoria.fromParse(parseObject)).toList();
    }else{
      throw ParseErrors.getDescription(response.error.code);
    }
  }

}