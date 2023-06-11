import 'package:expense_tracker_app/screen/expenses_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const ExpensesScreen(),
    ),
  );
}
