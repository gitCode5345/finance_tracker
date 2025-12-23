import 'package:finance_tracker/data/models/balance/balance.dart';
import 'package:finance_tracker/data/models/user/user.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart' as model_transaction;
import 'package:finance_tracker/data/models/enums/transaction_type_enum.dart';
import 'package:finance_tracker/core/database_tables.dart';
import 'package:bcrypt/bcrypt.dart';
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
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE Users (id INTEGER PRIMARY KEY,
                                                first_name VARCHAR(50) NOT NULL,
                                                last_name VARCHAR(50) NOT NULL,
                                                email VARCHAR(100) NOT NULL UNIQUE,
                                                hash_password VARCHAR(255) NOT NULL)''');
        await db.execute('''CREATE TABLE Balances (id INTEGER PRIMARY KEY,
                                                   balance REAL NOT NULL,
                                                   currency STRING NOT NULL,
                                                   user_id INTEGER,
                                                   FOREIGN KEY(user_id) REFERENCES Users(id))''');
        await db.execute('''CREATE TABLE Categories (id INTEGER PRIMARY KEY,
                                                     name VARCHAR(50) NOT NULL,
                                                     type VARCHAR(20) NOT NULL,
                                                     is_system BOOLEAN NOT NULL CHECK (is_system IN (0, 1)),
                                                     user_id INTEGER,
                                                     icon VARCHAR(100),
                                                     FOREIGN KEY(user_id) REFERENCES Users(id))''',
        );
        await db.execute('''CREATE TABLE Transactions (id INTEGER PRIMARY KEY,
                                                       amount REAL NOT NULL,
                                                       date TEXT NOT NULL,
                                                       type VARCHAR(20) NOT NULL,
                                                       category_id INTEGER NOT NULL,
                                                       user_id INTEGER NOT NULL,
                                                       note TEXT,
                                                       FOREIGN KEY(user_id) REFERENCES Users(id),
                                                       FOREIGN KEY(category_id) REFERENCES Categories(id))''',
        );
      },
    );
    return database;
  }

  Future<User> registerUser(User user) async {
    final db = await database;

    final findUser = await db.query(
      DatabaseTablesName.tableUsers,
      where: 'email = ?',
      whereArgs: [user.email],
      limit: 1,
    );

    if (findUser.isNotEmpty) {
      throw Exception('This email is already registered.');
    }

    final hashPassword = BCrypt.hashpw(user.password!, BCrypt.gensalt());

    final id = await db.insert(DatabaseTablesName.tableUsers, {
      'first_name': user.firstName,
      'last_name': user.lastName,
      'email': user.email,
      'hash_password': hashPassword,
    });

    return user.copyWith(id: id, hashPassword: hashPassword, password: null);
  }

  Future<User> loginUser(String email, String password) async {
    final db = await database;

    final findUser = await db.query(
      DatabaseTablesName.tableUsers,
      where: 'email = ?',
      whereArgs: [email],
      limit: 1,
    );

    if (!findUser.isNotEmpty) {
      throw Exception('No such account has been registered.');
    }

    final user = findUser.first;
    if (!BCrypt.checkpw(password, user['hash_password'].toString())) {
      throw Exception('Incorrect email or password');
    }
    
    return User.fromJson(user);
  }

  Future<Balance> addTransaction(User userModel, model_transaction.Transaction transactionModel, Balance balanceModel) async {
    final db = await database;

    final balance = await db.query(
        DatabaseTablesName.tableBalances, 
        where: 'user_id = ?', 
        whereArgs: [userModel.id]
      );

    final userBalance = balance.first;

    if (transactionModel.type == TransactionType.expense) {
      if (userBalance['balance'] as double < transactionModel.amount) {
        throw Exception('Insufficient funds');
      }

      final newBalance = (userBalance['balance'] as double) - transactionModel.amount;

      await db.update(
        DatabaseTablesName.tableBalances,
        {'balance': newBalance},
        where: 'user_id = ?',
        whereArgs: [userModel.id],
      );

      await db.insert(DatabaseTablesName.tableTransactions, {
        'amount': transactionModel.amount,
        'date': transactionModel.date,
        'type': TransactionType.expense.name,
        'category_id': transactionModel.categoryId,
        'user_id': userModel.id,
        'note': transactionModel.note,
      });

      return balanceModel.copyWith(balance: newBalance);

    } else {
      final newBalance = (userBalance['balance'] as double) + transactionModel.amount;

      await db.update(
        DatabaseTablesName.tableBalances,
        {'balance': newBalance},
        where: 'user_id = ?',
        whereArgs: [userModel.id],
      );

      await db.insert(DatabaseTablesName.tableTransactions, {
        'amount': transactionModel.amount,
        'date': transactionModel.date,
        'type': TransactionType.income.name,
        'category_id': transactionModel.categoryId,
        'user_id': userModel.id,
        'note': transactionModel.note,
      });

      return balanceModel.copyWith(balance: newBalance);
    }
  }

  Future<Balance> getUserBalance(int userId) async {
    final db = await database;

    final balance = await db.query(
      DatabaseTablesName.tableBalances, 
      where: 'user_id = ?',
      whereArgs: [userId],
      limit: 1,
    );

    if (balance.isNotEmpty) {
      return Balance.fromJson(balance.first);
    } else {
      throw Exception('Balance not found');
    }
  }

  Future<List<model_transaction.Transaction>> getUserTransactions(int userId) async {
    final db = await database;

    final transactions = await db.query(
      DatabaseTablesName.tableTransactions,
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'date DESC',
    );

    if (transactions.isNotEmpty) {
      return transactions.map((e) => model_transaction.Transaction.fromJson(e)).toList();
    } else {
      throw Exception('No transactions found');
    }
  }

  Future<User?> getUserByEmail(String email) async {
    final db = await database;

    final findUser = await db.query(
      DatabaseTablesName.tableUsers,
      where: 'email = ?',
      whereArgs: [email],
      limit: 1,
    );

    if (findUser.isNotEmpty) {
      return User.fromJson(findUser.first);
    } else {
      return null;
    }
  }
}
