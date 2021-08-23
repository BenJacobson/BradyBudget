import 'package:sqflite/sqflite.dart' hide Transaction;

import '/data/model/date.dart';
import '/data/model/transaction.dart';
import 'date.dart';

Future<void> createTableTransaction(DatabaseExecutor db) {
  return db.execute('''
    CREATE TABLE transaction_data(
      transaction_id INTEGER PRIMARY KEY,
      category_id INTEGER NOT NULL,
      cents INTEGER NOT NULL,
      date INTEGER NOT NULL,
      name TEXT NOT NULL,
      FOREIGN KEY (category_id)
        REFERENCES category (category_id) 
    );''');
}

Future<List<Transaction>> selectAllTransactions(DatabaseExecutor db) async {
  List<Map<String, dynamic>> rawTransactions = await db.query(
    'transactions',
    columns: [
      'transaction_id',
      'category_id',
      'cents',
      'date',
      'name',
    ],
  );
  return rawTransactions.map(fromRawTransaction).toList();
}

Future<Transaction> insertNewTransaction(
    DatabaseExecutor db, Transaction transaction) {
  if (transaction.transactionId != null) {
    throw ArgumentError('insertNewTransaction transactionId must be null');
  }
  return _insertTransaction(db, transaction);
}

Future<Transaction> updateTransaction(
    DatabaseExecutor db, Transaction transaction) {
  if (transaction.transactionId == null) {
    throw ArgumentError('updateTransaction transactionId must not be null');
  }
  return _insertTransaction(db, transaction);
}

Future<Transaction> _insertTransaction(
    DatabaseExecutor db, Transaction transaction) async {
  int transactionId = await db.insert(
    'transaction',
    toRawTransaction(transaction),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return Transaction(
    transactionId: transactionId,
    categoryId: transaction.categoryId,
    cents: transaction.cents,
    date: transaction.date,
    name: transaction.name,
  );
}

Transaction fromRawTransaction(Map<String, dynamic> rawTransaction) {
  int transactionId = rawTransaction['transaction_id'];
  int categoryId = rawTransaction['category_id'];
  int cents = rawTransaction['cents'];
  Date date = fromRawDate(rawTransaction['date']);
  String name = rawTransaction['name'];

  return Transaction(
    transactionId: transactionId,
    categoryId: categoryId,
    cents: cents,
    date: date,
    name: name,
  );
}

Map<String, dynamic> toRawTransaction(Transaction transaction) {
  return {
    'transaction_id': transaction.transactionId,
    'category_id': transaction.categoryId,
    'cents': transaction.cents,
    'date': toRawDate(transaction.date),
    'name': transaction.name,
  };
}
