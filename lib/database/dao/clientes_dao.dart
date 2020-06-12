import 'package:studiomallia/models/clientes.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studiomallia/database/app_database.dart';

class ClientesDao {

  static const String tableSQL = 'CREATE TABLE clientes('
  'id INTEGER PRIMARY KEY, '
  'nome TEXT, '
  'cpf TEXT,'
  'datanascimento TEXT,'
  'telefone TEXT,'
  'rua TEXT,'
  'cidade TEXT,'
  'estado TEXT)';

  Future<int> save(Clientes clientes) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(clientes);
    return db.insert('clientes', contactMap);
  }
  Future<int> deleteCustomer(int id) async {
    final Database db = await getDatabase();
    return await db.rawDelete('DELETE FROM clientes WHERE id = $id');
  }
  Future<int> updateCustomer(Clientes clientes) async {
    final Database db = await getDatabase();
    return await db.rawUpdate(
        'UPDATE clientes SET nome = ${clientes.nome}, cpf = ${clientes.cpf}, datanascimento = ${clientes.datanascimento}, telefone = ${clientes.telefone}, rua = ${clientes.rua}, cidade = ${clientes.cidade}, estado = ${clientes.estado}, WHERE id = ${clientes.id}'
    );
  }


  Map<String, dynamic> _toMap(Clientes clientes) {
    final Map<String, dynamic> clientesMap = Map();
    clientesMap['nome'] = clientes.nome;
    clientesMap['cpf'] = clientes.cpf;
    clientesMap['datanascimento'] = clientes.datanascimento;
    clientesMap['telefone'] = clientes.telefone;
    clientesMap['rua'] = clientes.rua;
    clientesMap['cidade'] = clientes.cidade;
    clientesMap['estado'] = clientes.estado;

    return clientesMap;
  }

  Future<List<Clientes>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('clientes');
    List<Clientes> contacts = _toList(result);
    print(contacts);
    return contacts;
  }

  List<Clientes> _toList(List<Map<String, dynamic>> result) {
    final List<Clientes> clientes = List();
    for (Map<String, dynamic> row in result) {
      final Clientes cliente =
      Clientes(row['id'], row['nome'] , row['cpf'], row['datanascimento'], row['telefone'], row['rua'], row['cidade'], row['estado']);
      clientes.add(cliente);

    }
    return clientes;
  }

}