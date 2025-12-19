import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'master_db.db');

    await deleteDatabase(databasePath);

    final database = openDatabase(
      databasePath,
      version: 1,
      onConfigure: (db) => db.execute('''pragma foreign_keys = ON'''),
      onCreate: (db, version) {
        db.execute(
          '''CREATE TABLE Users (id INTEGER PRIMARY KEY,
                                          first_name VARCHAR(50) NOT NULL,
                                          last_name VARCHAR(50) NOT NULL,
                                          email VARCHAR(100) NOT NULL,
                                          hash_password VARCHAR(255) NOT NULL)'''
        );
        db.execute(
          '''CREATE TABLE Categories (id INTEGER PRIMARY KEY,
                                      name VARCHAR(50) NOT NULL,
                                      type VARCHAR(20) NOT NULL,
                                      is_system BOOLEAN NOT NULL CHECK (is_system IN (0, 1)),
                                      user_id INTEGER,
                                      icon VARCHAR(100),
                                      FOREIGN KEY(user_id) REFERENCES users(id))''',
        );
        db.execute(
          '''CREATE TABLE Transactions (id INTEGER PRIMARY KEY,
                                        amount REAL NOT NULL,
                                        date TEXT NOT NULL,
                                        type VARCHAR(20) NOT NULL,
                                        category_id INTEGER NOT NULL,
                                        user_id INTEGER NOT NULL,
                                        note TEXT,
                                        FOREIGN KEY(user_id) REFERENCES users(id),
                                        FOREIGN KEY(category_id) REFERENCES categories(id))''',
        );
      },
    );
    return database;
  }
}
