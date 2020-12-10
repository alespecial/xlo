enum TipoUsuario {PARTICULAR, PROFISSIONAL}
class Usuario {

  Usuario({
    this.idUsuario,
    this.nome,
    this.email,
    this.telefone,
    this.senha,
    this.tipoUsuario = TipoUsuario.PARTICULAR,
    this.dataCriacao
  });

  String idUsuario;
  String nome;
  String email;
  String telefone;
  String senha;
  TipoUsuario tipoUsuario;
  DateTime dataCriacao;

  @override
  String toString() {
    return 'Usuario{idUsuario: $idUsuario, nome: $nome, email: $email, telefone: $telefone, senha: $senha, tipoUsuario: $tipoUsuario, dataCriacao: $dataCriacao}';
  }
}