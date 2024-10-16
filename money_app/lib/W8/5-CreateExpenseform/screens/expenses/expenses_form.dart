import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  String value = '';
  String moneyValue = '';

  void onTextPressed(String newValue) {
    setState(() {
      value = newValue;
    });
  }

  void onMoneyPressed(String newValue) {
    setState(() {
      moneyValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            onChanged: onTextPressed,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            onChanged: onMoneyPressed,
            maxLength: 50,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, 
            ],
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.attach_money),
              label: Text('...'),
            ),
          ),
          Text("Value is $value"),
        ],
      ),
    );
  }
}
