import 'package:expense_tracker_app/widget/expenses/expenses_list.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Expense> expenseList = [
      Expense(
          title: 'buy mac',
          amount: 2000,
          category: Category.work,
          date: DateTime.now()),
      Expense(
          title: 'buy coffe',
          amount: 10,
          category: Category.food,
          date: DateTime.now()),
      Expense(
          title: 'bills',
          amount: 100,
          category: Category.work,
          date: DateTime.now()),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const Text('Chart...'),
            Expanded(
              child: ExpensesList(expensesList: expenseList),
            ),
            const Text('Chart...'),
          ],
        ),
      ),
    );
  }
}
