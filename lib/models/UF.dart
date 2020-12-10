class UF {

  UF({this.id, this.iniciais, this.nome});

  int id;
  String iniciais;
  String nome;

  factory UF.fromJson(Map<String, dynamic> json) => UF(
    id: json["id"],
    iniciais: json["sigla"],
    nome: json["nome"],
  );

  @override
  String toString() {
    return 'UF{id: $id, iniciais: $iniciais, nome: $nome}';
  }
}