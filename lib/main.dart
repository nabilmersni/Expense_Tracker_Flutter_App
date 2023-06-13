import 'package:expense_tracker_app/screen/expenses_screen.dart';
import 'package:expense_tracker_app/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kLightTheme,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const ExpensesScreen(),
    ),
  );
}
