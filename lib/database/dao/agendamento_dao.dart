import 'package:studiomallia/models/agendamento.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studiomallia/database/app_database.dart';

class AgendamentoDao {

  static const String tableSQL = 'CREATE TABLE agendamento('
      'id INTEGER PRIMARY KEY, '
      'cliente TEXT, '
      'dataagendamento TEXT,'
      'horario TEXT,'
      'servico TEXT)';

  Future<int> save(Agendamento agendamento) async {
    final Database db = await getDatabase(tableSQL);
    Map<String, dynamic> agendaMap = _toMap(agendamento);
    return db.insert('Agendamento', agendaMap);
  }

  Map<String, dynamic> _toMap(Agendamento agendamento) {
    final Map<String, dynamic> agendamentoMap = Map();
    agendamentoMap['cliente'] = agendamento.clienteAg;
    agendamentoMap['dataagendamento'] = agendamento.dataAg;
    agendamentoMap['horario'] = agendamento.horaAg;
    agendamentoMap['servico'] = agendamento.servicoAg;

    return agendamentoMap;
  }

  Future<List<Agendamento>> findAll() async {
    final Database db = await getDatabase(tableSQL);
    final List<Map<String, dynamic>> result = await db.query('agendamento');
    List<Agendamento> agenda = _toList(result);

    return agenda;
  }

  List<Agendamento> _toList(List<Map<String, dynamic>> result) {
    final List<Agendamento> agendamento = List();
    for (Map<String, dynamic> row in result) {
      final Agendamento agendamentos =
      Agendamento(row['id'], row['cliente'] , row['dataagendamento'], row['horario'], row['servico']);
      agendamento.add(agendamentos);
    }
    return agendamento;
  }
}