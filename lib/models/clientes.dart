class Clientes {
  final int id;
  final String nome;
  final String cpf;
  final String datanascimento;
  final String telefone;
  final String rua;
  final String cidade;
  final String estado;

  Clientes(this.id, this.nome, this.cpf, this.datanascimento, this.telefone,
      this.rua, this.cidade, this.estado);

  @override
  String toString() {
    // TODO: implement toString
    return 'Cliente{ nome: $nome, cpf: $cpf, datanascimento: $datanascimento, telefone : $telefone, rua: $rua, cidade: $cidade, estado:$estado';
  }
}
