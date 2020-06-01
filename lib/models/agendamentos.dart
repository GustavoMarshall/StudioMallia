class Agendamentos {
  final int id;
  final String clienteAg;
  final String dataAg;
  final String horaAg;
  final String servicoAg;


  Agendamentos(this.id, this.clienteAg, this.dataAg, this.horaAg, this.servicoAg);

  @override
  String toString() {
    // TODO: implement toString
    return 'Agendamentos{nome: $clienteAg, Data de Agendamento: $dataAg, Hora: $horaAg, Seviço : $servicoAg';
  }
}
