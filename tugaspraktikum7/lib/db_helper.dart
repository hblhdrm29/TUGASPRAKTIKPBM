import 'halu.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  static late Database _database;

  Future<Database> get database async {
    return _database = await _initializeDb();
  }

  static const String _tableName = 'halus';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'halu_db.db'),
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, kegiatan TEXT, waktu TEXT, dimana TEXT, ngapain TEXT)''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertHalu(Halu halu) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      halu.toMap(),
    );
  }

  Future<List<Halu>> gethalus() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableName);
    return result.map((res) => Halu.fromMap(res)).toList();
  }

  Future<int> deleteHalu(int id) async {
    final Database db = await database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateHalu(Halu halu) async {
    final Database db = await database;
    return await db.update(_tableName, halu.toMap(),
        where: 'id = ?', whereArgs: [halu.id]);
  }
}