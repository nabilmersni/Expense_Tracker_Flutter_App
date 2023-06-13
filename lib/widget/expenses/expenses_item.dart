import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(children: [
          Text(
            expense.title,
            // style: Theme.of(context).textTheme.displayLarge,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            children: [
              Text(
                '\$${expense.amount.toStringAsFixed(2)}',
              ),
              const SizedBox(
                height: 50,
              ),
              const Spacer(),
              Icon(categoryIcons[expense.category]),
              const SizedBox(
                width: 10,
              ),
              Text(expense.formatedDate),
            ],
          ),
        ]),
      ),
    );
  }
}
