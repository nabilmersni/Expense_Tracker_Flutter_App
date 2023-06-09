import 'package:uuid/uuid.dart';

Uuid uuid = new Uuid();

enum Category { food, travel, leisure, work }

class Expense {
  Expense({required this.title, required this.amount}) : id = uuid.v4();

  String id;
  final String title;
  final double amount;
}
