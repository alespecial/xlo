import 'package:xlo_mobx/models/Cidade.dart';
import 'package:xlo_mobx/models/UF.dart';

import 'UF.dart';

class Endereco {

  UF uf;
  Cidade cidade;

  String cep;
  String bairro;

  Endereco({this.uf, this.cep, this.bairro, this.cidade});

  @override
  String toString() {
    return 'Endereco{uf: $uf, cidade: $cidade, cep: $cep, bairro: $bairro}';
  }
}