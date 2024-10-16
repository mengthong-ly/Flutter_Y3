import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  void onAdd() {
    if (_titleController.text == '' ||
        double.parse(_valueController.text).isNegative) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            elevation: 10,
            child: Container(
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Invalid',
                        style: TextStyle(
                          color: Color.fromARGB(255, 251, 0, 0),
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                        ),
                      ),
                      const Text(
                        'Wrong HAHAHAHAHAHAHAHAH',
                        style: TextStyle(
                          color: Color.fromARGB(255, 9, 8, 8),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Ok'))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else {
      // 1- Get the values from inputs
      String title = _titleController.text;
      double amount = double.parse(_valueController.text);

      // 2- Create the expense
      Expense expense = Expense(
          title: title,
          amount: amount,
          date: DateTime.now(), //  TODO :  For now it s a fake data
          category: Category.food); //  TODO :  For now it s a fake data

      // 3- Ask the parent to add the expense
      widget.onCreated(expense);

      // 4- Close modal
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
          TextField(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: onAdd, child: const Text('Create')),
            ],
          )
        ],
      ),
    );
  }
}
