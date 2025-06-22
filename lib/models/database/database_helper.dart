import 'package:flutter_payment_demo/models/dog.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  // Singleton pattern
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final documentsDirectory = await getApplicationDocumentsDirectory();
      print("Documents directory: ${documentsDirectory.path}");
      final path = join(documentsDirectory.path, 'doggie_database.db');
      print("Database path: $path");

      return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
      );
    } catch (e) {
      print("Error initializing database: $e");
      rethrow;
    }
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE dogs(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE payments(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        data TEXT NOT NULL,
        status BOOLEAN NOT NULL
      )
    ''');
  }

  // CRUD Operations
  Future insertPayment({required data}) async {
    final db = await instance.database;
    await db.rawInsert(
        'INSERT INTO payments(data, status) VALUES(?, ?)', [data, false]);
  }

  Future<int> insertDog(Dog dog) async {
    final db = await instance.database;
    return await db.insert('dogs', dog.toMap());
  }

  Future getPayments() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT * FROM payments');
    return result;
  }

  Future<List<Dog>> getDogs() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i) {
      return Dog.fromMap(maps[i]);
    });
  }

  Future<int> updateDog(Dog dog) async {
    final db = await instance.database;
    return await db.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  Future<int> deleteDog(int id) async {
    final db = await instance.database;
    return await db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
