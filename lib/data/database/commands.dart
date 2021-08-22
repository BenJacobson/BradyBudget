String configureDatabase() {
  return 'PRAGMA foreign_keys = ON;';
}

String createTableBudget() {
  return '''CREATE TABLE budget(
              budget_id INTEGER PRIMARY KEY,
              cents INTEGER NOT NULL,
              start_date INTEGER NOT NULL,
              end_date INTEGER NOT NULL
            );''';
}

String createTableCategory() {
  return '''CREATE TABLE category(
              category_id INTEGER PRIMARY KEY,
              name TEXT NOT NULL
            );''';
}

String createTableBudgetCategory() {
  return '''CREATE TABLE budget_category(
              budget_id INTEGER NOT NULL,
              category_id INTEGER NOT NULL,
              cents INTEGER NOT NULL,
              FOREIGN KEY (budget_id)
                REFERENCES budget (category_id),
              FOREIGN KEY (category_id)
                REFERENCES category (category_id) 
            );''';
}

String createTableTransaction() {
  return '''CREATE TABLE transaction_data(
              transaction_id INTEGER PRIMARY KEY,
              category_id INTEGER NOT NULL,
              cents INTEGER NOT NULL,
              date INTEGER NOT NULL,
              name TEXT NOT NULL,
              FOREIGN KEY (category_id)
                REFERENCES category (category_id) 
            );''';
}

String selectAllBudgets() {
  return '''SELECT
              budget_id,
              cents,
              start_date,
              end_date
            FROM
              budget
            ;''';
}
