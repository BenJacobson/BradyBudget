import '/data/data_manager.dart';
import '/data/model/exports.dart';

Future<void> createTestData(DataManager dataManager) async {
  Budget budget = await dataManager.insertNewBudget(Budget(
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

  Category categoryWants = await dataManager.insertNewCategory(Category(
    name: "Wants",
  ));

  Category categoryNeeds = await dataManager.insertNewCategory(Category(
    name: "Needs",
  ));

  await dataManager.insertNewBudgetCategory(BudgetCategory(
    budgetId: budget.budgetId!,
    categoryId: categoryWants.categoryId!,
    cents: 5000,
  ));

  await dataManager.insertNewBudgetCategory(BudgetCategory(
    budgetId: budget.budgetId!,
    categoryId: categoryNeeds.categoryId!,
    cents: 5000,
  ));

  await dataManager.insertNewTransaction(
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

  await dataManager.insertNewTransaction(
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

  await dataManager.insertNewTransaction(
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
