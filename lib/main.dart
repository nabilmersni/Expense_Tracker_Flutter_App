import 'package:expense_tracker_app/screen/expenses_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesScreen(),
    ),
  );
}
