import 'package:studiomallia/models/agendamentos.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studiomallia/database/app_database.dart';

class AgendamentosDao {

  static const String tableSQL = 'CREATE TABLE agendamentos('
      'id INTEGER PRIMARY KEY, '
      'cliente TEXT, '
      'dataagendamento TEXT,'
      'horario TEXT,'
      'servico TEXT)';


  Future<int> save(Agendamentos agendamentos) async {
    final Database db = await getDatabase();
    Map<String, dynamic> agendaMap = _toMap(agendamentos);
    return db.insert('Agendamentos', agendaMap);
  }

  Map<String, dynamic> _toMap(Agendamentos agendamentos) {
    final Map<String, dynamic> agendamentosMap = Map();
    agendamentosMap['cliente'] = agendamentos.clienteAg;
    agendamentosMap['dataagendamento'] = agendamentos.dataAg;
    agendamentosMap['horario'] = agendamentos.horaAg;
    agendamentosMap['servico'] = agendamentos.servicoAg;

    return agendamentosMap;
  }

  Future<List<Agendamentos>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('agendamentos');
    List<Agendamentos> agenda = _toList(result);

    return agenda;
  }

  List<Agendamentos> _toList(List<Map<String, dynamic>> result) {
    final List<Agendamentos> agendamentos = List();
    for (Map<String, dynamic> row in result) {
      final Agendamentos agendamento =
      Agendamentos(row['id'], row['cliente'] , row['dataagendamento'], row['horario'], row['servico']);
      agendamentos.add(agendamento);
    }
    return agendamentos;
  }

  Future<List<Map<String, dynamic>>> getAgendaData() async {
    final ret = await db.rawQuery('SELECT * FROM agendamentos WHERE dataagendamento = ? ORDER BY horario asc;');
    return ret;
  }



  }