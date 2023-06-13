import 'package:expense_tracker_app/screen/add_expense_modal.dart';
import 'package:expense_tracker_app/theme/theme.dart';
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
    final expenseIndex = _expenseList.indexOf(expense);
    setState(() {
      _expenseList.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted.'),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenseList.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget listContent = const Center(
      child: Text('No expense found.'),
    );
    if (_expenseList.isNotEmpty) {
      listContent = ExpensesList(
          expensesList: _expenseList, removeExpense: removeExpense);
    }

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
            Text(
              'Chart....',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: kLightColorScheme['primary'],
                  ),
            ),
            Expanded(child: listContent),
          ],
        ),
      ),
    );
  }
}
