import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Provider {
  Database db;
  String _path;

  Future open({ String dbName : 'food'}) async {
    var databasesPath = await getDatabasesPath();
    _path = join(databasesPath, dbName);

    db = await openDatabase(_path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
                  create table products ( 
                      id integer primary key ,
                      )
                  ''');
        });
  }

  Future close() async => db.close();
}