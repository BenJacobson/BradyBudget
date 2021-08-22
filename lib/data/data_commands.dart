String configureDatabase() {
  return 'PRAGMA foreign_keys = ON;';
}

String createTableBudget() {
  return '''CREATE TABLE budget(
              budget_id INTEGER PRIMARY KEY,
              cents INTEGER,
              start_date INTEGER,
              end_date INTEGER
            );''';
}

String createTableCategory() {
  return '''CREATE TABLE category(
              category_id INTEGER PRIMARY KEY,
              name TEXT
            );''';
}

String createTableBudgetCategory() {
  return '''CREATE TABLE budget_category(
              budget_id INTEGER,
              category_id INTEGER,
              cents INTEGER,
              FOREIGN KEY (budget_id)
                REFERENCES budget (category_id),
              FOREIGN KEY (category_id)
                REFERENCES category (category_id) 
            );''';
}

String createTableTransaction() {
  return '''CREATE TABLE transaction_data(
              transaction_id INTEGER PRIMARY KEY,
              category_id INTEGER,
              cents INTEGER,
              date INTEGER,
              name TEXT,
              FOREIGN KEY (category_id)
                REFERENCES category (category_id) 
            );''';
}
