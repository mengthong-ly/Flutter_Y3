import 'dart:ffi';

import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onExpenseRemoved});

  final List<Expense> expenses;

  final Function(Expense) onExpenseRemoved;

  Future<void> triggerSnackBar(BuildContext context, int index) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${expenses[index].title}  removed"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: expenses.isNotEmpty
          ? ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) => Dismissible(
                  onDismissed: (direction) => {
                        triggerSnackBar(context, index),
                        onExpenseRemoved(expenses[index]),
                      },
                  key: Key(expenses[index].id),
                  child: ExpenseItem(expenses[index])),
            )
          : const Center(
              child: Text('Empty Go add one'),
            ),
    );
  }
}
