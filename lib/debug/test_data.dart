import '/database/lib.dart';
import '/model/lib.dart';

Future<void> createTestData(DatabaseAccessObject dao) async {
  await dao.deleteAll();

  Budget budget = await dao.insertNewBudget(Budget(
    cents: 10000,
    startDate: Date(
      year: 2021,
      month: 1,
      day: 1,
    ),
    endDate: Date(
      year: 2021,
      month: 1,
      day: 31,
    ),
    name: "January 2021",
  ));

  Category categoryWants = await dao.insertNewCategory(Category(
    name: "Wants",
  ));

  Category categoryNeeds = await dao.insertNewCategory(Category(
    name: "Needs",
  ));

  await dao.insertNewBudgetCategory(BudgetCategory(
    budgetId: budget.budgetId!,
    categoryId: categoryWants.categoryId!,
    cents: 5000,
  ));

  await dao.insertNewBudgetCategory(BudgetCategory(
    budgetId: budget.budgetId!,
    categoryId: categoryNeeds.categoryId!,
    cents: 5000,
  ));

  await dao.insertNewTransaction(
    Transaction(
        categoryId: categoryWants.categoryId,
        cents: 1000,
        date: Date(
          year: 2021,
          month: 1,
          day: 11,
        ),
        name: "Ice cream"),
  );

  await dao.insertNewTransaction(
    Transaction(
        categoryId: categoryNeeds.categoryId,
        cents: 3000,
        date: Date(
          year: 2021,
          month: 1,
          day: 21,
        ),
        name: "Water bill"),
  );

  await dao.insertNewTransaction(
    Transaction(
        categoryId: categoryWants.categoryId,
        cents: 99999999,
        date: Date(
          year: 2021,
          month: 2,
          day: 1,
        ),
        name: "Outside budget range"),
  );
}
