import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_data.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('userdata.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE userData (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        gender TEXT,
        age INTEGER,
        height REAL,
        weight REAL,
        activityLevel TEXT,
        goal TEXT,
        bmr REAL,
        finalCalories REAL
      )
    ''');
  }

  Future<int> insertUserData(UserData data) async {
    final db = await instance.database;
    return await db.insert('userData', data.toMap());
  }

  Future<List<UserData>> getAllUserData() async {
    final db = await instance.database;
    final result = await db.query('userData');
    return result.map((json) => UserData(
      id: json['id'] as int?,
      gender: json['gender'] as String,
      age: json['age'] as int,
      height: json['height'] as double,
      weight: json['weight'] as double,
      activityLevel: json['activityLevel'] as String,
      goal: json['goal'] as String,
      bmr: json['bmr'] as double,
      finalCalories: json['finalCalories'] as double,
    )).toList();
  }
}
