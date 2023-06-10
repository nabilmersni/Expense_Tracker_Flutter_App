import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widget/expenses/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expensesList});

  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) => ExpensesItem(expensesList[index]),
    );
  }
}
