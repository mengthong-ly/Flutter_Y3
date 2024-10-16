import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  String get title => _titleController.text;

  late Category category = Category.food;
  DateTime? selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  Future<void> triggerDatePicker() async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );
    if (dateTime != null) {
      setState(() {
        selectedDate = dateTime;
      });
    }
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);

    // 2- Create the expense
    Expense expense = Expense(
      title: title,
      amount: amount,
      date: selectedDate!, //  TODO :  For now it s a fake data
      category: category,
    ); //  TODO :  For now it s a fake data

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: _valueController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      prefix: Text('\$ '),
                      label: Text('Amount'),
                    ),
                  ),
                ),
                // showDialog(context: context, builder: builder)
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(selectedDate == null
                        ? 'Not Selected'
                        : DateFormat('dd/MM/yyyy').format(selectedDate!)),
                    IconButton(
                      onPressed: triggerDatePicker,
                      icon: const Icon(Icons.date_range),
                    )
                  ],
                )
              ],
            ),
            DropdownButton(
              value: category,
              items: const [
                DropdownMenuItem(value: Category.food, child: Text('Food')),
                DropdownMenuItem(
                    value: Category.leisure, child: Text('leisure')),
                DropdownMenuItem(value: Category.travel, child: Text('travel')),
                DropdownMenuItem(value: Category.work, child: Text('work')),
              ],
              onChanged: (value) {
                setState(() {
                  category = value!;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: onCancel, child: const Text('Cancel')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: onAdd, child: const Text('Create')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
