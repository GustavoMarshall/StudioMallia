import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase(sql) async {
  final String path = join(await getDatabasesPath(), 'studiomallia.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(sql);
  }, version: 1);
}

