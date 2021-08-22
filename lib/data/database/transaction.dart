import 'package:sqflite/sqflite.dart' hide Transaction;

import '/data/model/date.dart';
import '/data/model/transaction.dart';
import 'date.dart';

Future<void> createTableTransaction(Database db) {
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
