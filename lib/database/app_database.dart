import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studiomallia/models/agendamentos.dart';

Future<Database> getDatabase() async {
  final String sql_agendamentos = 'CREATE TABLE agendamentos('
      'id INTEGER PRIMARY KEY, '
      'cliente TEXT, '
      'dataagendamento TEXT,'
      'horario TEXT,'
      'servico TEXT)';
  final String sql_clientes = 'CREATE TABLE clientes('
      'id INTEGER PRIMARY KEY, '
      'nome TEXT, '
      'cpf TEXT,'
      'datanascimento TEXT,'
      'telefone TEXT,'
      'rua TEXT,'
      'cidade TEXT,'
      'estado TEXT)';



  final String path = join(await getDatabasesPath(), 'studiomallia_databasev6.db');
  return openDatabase(path, onCreate: (db, version) async {
    print('Executando SQL AGENDAMENTOS: $sql_agendamentos');
    await db.execute(sql_agendamentos);
    print('Executando SQL CLIENTES: $sql_clientes');
    await db.execute(sql_clientes);

  }, version: 1);
}

