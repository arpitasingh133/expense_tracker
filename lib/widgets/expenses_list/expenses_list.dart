import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        //swipe off effect using Dismissible
        key: ValueKey(expenses[index] //key make widgets uniquely identifiable
            ),
        background: Container(
          color: const Color.fromARGB(
              255, 225, 55, 55), // or, Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context)
                  .cardTheme
                  .margin!
                  .horizontal), //or, const EdgeInsets.symmetric(horizontal: 16),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
