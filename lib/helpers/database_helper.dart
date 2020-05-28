//import 'dart:async';
//import 'dart:io';
//import 'package:studiomallia/models/clientes.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:sqflite/sqflite.dart';
//
//class DatabaseHelper {
//  static DatabaseHelper _databaseHelper;
//  static Database _database;
//
//  String ClientesTable = 'clientes';
//  String colId = 'id';
//  String colNome = 'nome';
//  String colCpf = 'cpf';
//  String colDatanascimento = 'datanascimento';
//  String colTelefone = 'telefone';
//  String colRua = 'rua';
//  String colCidade = 'cidade';
//  String colEstado = 'estado';
//
//  DatabaseHelper._createInstance();
//
//  factory DatabaseHelper() {
//    if (_databaseHelper == null) {
//      _databaseHelper = DatabaseHelper._createInstance();
//    }
//    return _databaseHelper;
//  }
//
//  Future<Database> get database async {
//    if (_database == null) {
//      _database = await initializeDatabase();
//    }
//    return _database;
//  }
//
//  Future<Database> initializeDatabase() async {
//    Directory directory = await getApplicationDocumentsDirectory();
//    String path = directory.path + 'contatos.db';
//
//    var clientesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
//    return clientesDatabase;
//  }
//
//  void _createDb(Database db, int newVersion) async {
//    await db.execute(
//        'CREATE TABLE $ClientesTable $colId INTERGER PRIMARY KEY AUTOINCREMENT, $colNome TEXT, $colCpf TEXT, $colDatanascimento TEXT, $colTelefone TEXT, $colRua TEXT, $colCidade TEXT, $colEstado TEXT ');
//  }
//
//  //inserindo cliente no banco
//  Future<int> insertClientes(Clientes clientes) async {
//    Database db = await this.database;
//
//    var resultado = await db.insert(ClientesTable, clientes.toMap());
//
//    return resultado;
//  }
//
//  // retornar um contato pela a id
//  Future<Clientes> getCliente(int id) async {
//    Database db = await this.database;
//
//    List<Map> maps = await db.query(ClientesTable,
//        columns: [
//          colId,
//          colNome,
//          colCpf,
//          colDatanascimento,
//          colTelefone,
//          colRua,
//          colCidade,
//          colEstado
//        ],
//        where: "$colId = ?",
//        whereArgs: [id]);
//
//    if (maps.length > 0) {
//      return Clientes.fromMap(maps.first);
//    } else {
//      return null;
//    }
//  }
//
//  Future<List<Clientes>> getClientes() async{
//    Database db = await this.database;
//
//    var resultado = await db.query(ClientesTable);
//
//      List<Clientes> lista = resultado.isNotEmpty ? resultado.map(
//              (c) => Clientes.fromMap(c)).toList() : [];
//
//        return lista;
//
//
//  }
//
//  //Atualizar o objeto Contato e salva no banco de dados
//  Future<int> updateClientes(Clientes clientes) async {
//    var db = await this.database;
//
//    var resultado = await db.update(ClientesTable, clientes.toMap(),
//        where: '$colId = ?', whereArgs: [clientes.id]);
//
//    return resultado;
//  }
//
//  //Deletar um objeto Contato do banco de dados
//  Future<int> deleteClientes(int id) async {
//    var db = await this.database;
//
//    int resultado = await db.delete(ClientesTable, where: "$colId = ?", whereArgs: [id]);
//
//    return resultado;
//  }
//
////Obtem o número de objetos contato no banco de dados
//  Future<int> getCount() async {
//    Database db = await this.database;
//    List<Map<String, dynamic>> x =
//        await db.rawQuery('SELECT COUNT (*) from $ClientesTable');
//
//    int resultado = Sqflite.firstIntValue(x);
//    return resultado;
//  }
//
//  Future close() async {
//    Database db = await this.database;
//    db.close();
//  }
//}
