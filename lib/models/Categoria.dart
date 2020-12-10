import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/repositorios/ChavesTabelas.dart';

class Categoria {

  final String idCategoria;
  final String descricao;

  Categoria({this.idCategoria, this.descricao});

  Categoria.fromParse(ParseObject parseObject) :
      idCategoria = parseObject.objectId,
      descricao = parseObject.get(keyDescricaoCategoria);

  @override
  String toString() {
    return 'Categoria{idCategoria: $idCategoria, descricao: $descricao}';
  }
}