import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final String _databaseName = "money_calc.db";
  final int _databaseVersion = 1;
  final String _sqlFilePath = 'assets/table.sql';

  // Singleton pattern
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  // Chỉ có một tham chiếu đến database
  static Database? _database;
  Future<Database> get database async {
    _database ??= await _initDatabase();

    return _database!;
  }

  // Mở database
  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onConfigure(Database db) async {
    // Add support for cascade delete
    await db.execute("PRAGMA foreign_keys = ON");
  }

  // Tạo bảng
  Future<void> _onCreate(Database db, int version) async {
    final sqlFile = await rootBundle.loadString(_sqlFilePath);

    final scripts = sqlFile.split(';');

    final batch = db.batch();
    for (var i = 0; i < scripts.length - 1; i++) {
      final sql = scripts[i];
      batch.execute(sql);
    }
    await batch.commit(noResult: true);

    print('onCreate');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('onUpgrade');
  }

  Future<void> close() async {
    if (_database == null) return;

    await _database?.close();
    _database = null;
  }
}
