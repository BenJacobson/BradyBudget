part of database;

Future<void> _createTableTransaction(DatabaseExecutor db) {
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

Future<List<Transaction>> _selectAllTransactions(DatabaseExecutor db) async {
  List<Map<String, dynamic>> rawTransactions = await db.query(
    'transaction_data',
    columns: [
      'transaction_id',
      'category_id',
      'cents',
      'date',
      'name',
    ],
  );
  return rawTransactions.map(_fromRawTransaction).toList();
}

Future<Transaction> _insertNewTransaction(
    DatabaseExecutor db, Transaction transaction) {
  if (transaction.transactionId != null) {
    throw ArgumentError('insertNewTransaction transactionId must be null');
  }
  return _insertTransaction(db, transaction);
}

Future<Transaction> _updateTransaction(
    DatabaseExecutor db, Transaction transaction) {
  if (transaction.transactionId == null) {
    throw ArgumentError('updateTransaction transactionId must not be null');
  }
  return _insertTransaction(db, transaction);
}

Future<Transaction> _insertTransaction(
    DatabaseExecutor db, Transaction transaction) async {
  int transactionId = await db.insert(
    'transaction_data',
    _toRawTransaction(transaction),
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

Transaction _fromRawTransaction(Map<String, dynamic> rawTransaction) {
  int transactionId = rawTransaction['transaction_id'];
  int categoryId = rawTransaction['category_id'];
  int cents = rawTransaction['cents'];
  Date date = _fromRawDate(rawTransaction['date']);
  String name = rawTransaction['name'];

  return Transaction(
    transactionId: transactionId,
    categoryId: categoryId,
    cents: cents,
    date: date,
    name: name,
  );
}

Map<String, dynamic> _toRawTransaction(Transaction transaction) {
  return {
    'transaction_id': transaction.transactionId,
    'category_id': transaction.categoryId,
    'cents': transaction.cents,
    'date': _toRawDate(transaction.date),
    'name': transaction.name,
  };
}
