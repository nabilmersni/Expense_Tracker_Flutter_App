import 'package:expense_tracker_app/screen/add_expense_modal.dart';
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
  final List<Expense> _expenseList = [
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

  void _showAddExpenseOverley() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddExpenseModal(addExpense),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      _expenseList.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      _expenseList.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense app'),
        actions: [
          IconButton(
            onPressed: _showAddExpenseOverley,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const Text('Chart....'),
            Expanded(
              child: ExpensesList(
                  expensesList: _expenseList, removeExpense: removeExpense),
            ),
          ],
        ),
      ),
    );
  }
}
