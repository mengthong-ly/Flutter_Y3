enum ExpenseType {
  food,
  travel,
  leisure,
  work;
}

class Expense {
  final ExpenseType type;
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({
    required this.type,
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
