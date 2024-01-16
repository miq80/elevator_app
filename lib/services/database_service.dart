import 'package:house_app/models/house.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _database;
  static final DatabaseService instance = DatabaseService._();

  DatabaseService._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'space_scutum_house_app.db');
    print(path);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE buildings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            floorsAmount INTEGER
          )
        ''');
      },
    );
  }

  Future<int> insertBuilding(String name, String floors) async {
    final db = await database;
    int lastInsertedId = await db.rawInsert('''
    INSERT INTO buildings(name, floorsAmount) VALUES(?,?)
  ''', [name, floors]);

    return lastInsertedId;
  }

  Future<List<House>> getBuildings() async {
    final db = await database;
    try {
      final data = await db.query('buildings');
      return data.map(House.formJSON).toList();
    } catch (e, t) {
      print(e);
      print(t);
      rethrow;
    }
  }
}
