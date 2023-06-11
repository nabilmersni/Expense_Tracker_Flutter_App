import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widget/expenses/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expensesList, required this.removeExpense});

  final List<Expense> expensesList;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expensesList[index]),
        child: ExpensesItem(expensesList[index]),
        onDismissed: (direction) {
          removeExpense(expensesList[index]);
        },
      ),
    );
  }
}
