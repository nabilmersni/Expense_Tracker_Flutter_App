import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';

class AddExpenseModal extends StatefulWidget {
  const AddExpenseModal(this.addExpense, {super.key});

  final addExpense;
  @override
  State<AddExpenseModal> createState() {
    return _AddExpenseModalState();
  }
}

class _AddExpenseModalState extends State<AddExpenseModal> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _pickedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    super.dispose();
    _amountController.dispose();
    _titleController.dispose();
  }

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 5, now.month, now.day);
    final lastDate = DateTime(now.year + 5, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    setState(() {
      _pickedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final entredAmount = double.tryParse(_amountController.text);
    final isInvalidAmount = entredAmount == null || entredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        isInvalidAmount ||
        _pickedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid data'),
          content: const Text('data is not valid'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
      return;
    }
    final addedExpense = Expense(
        title: _titleController.text,
        amount: entredAmount,
        category: _selectedCategory,
        date: _pickedDate!);
    widget.addExpense(addedExpense);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              // border: OutlineInputBorder(),
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$ ',
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _pickedDate == null
                          ? 'no date selected'
                          : formatter.format(_pickedDate!),
                    ),
                    IconButton(
                      onPressed: _showDatePicker,
                      icon: const Icon(Icons.date_range),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          DropdownButton(
            value: _selectedCategory,
            items: Category.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(
                      category.name.toUpperCase(),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _selectedCategory = value;
              });
            },
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text('Save'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
