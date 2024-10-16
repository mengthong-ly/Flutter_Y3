import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/web.dart';
import 'package:money_app/W8/activities/expense.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Expenses(),
    );
  }
}

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
  });

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  static Uuid uuid = const Uuid();
  List<Expense> expenses = [
    Expense(
      type: ExpenseType.food,
      id: uuid.v4(),
      title: 'Groceries',
      amount: 123.45,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Expense(
      type: ExpenseType.travel,
      id: uuid.v4(),
      title: 'Train Ticket',
      amount: 45.30,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Expense(
      type: ExpenseType.leisure,
      id: uuid.v4(),
      title: 'Clothes',
      amount: 200.00,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Expense(
      type: ExpenseType.travel,
      id: uuid.v4(),
      title: 'Electricity Bill',
      amount: 80.50,
      date: DateTime.now().subtract(const Duration(days: 4)),
    ),
    Expense(
      type: ExpenseType.work,
      id: uuid.v4(),
      title: 'Movie Night',
      amount: 30.00,
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];
  void add() {
    Logger().d('add hz ai ah jm');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottomSheet(
                      constraints: const BoxConstraints.expand(),
                      onClosing: () {},
                      builder: (context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                          child: Center(
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.blue[700],
                              ),
                              onPressed: () {
                                add();
                                Navigator.pop(context);
                              },
                              child: const Text('Close'),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) {
            Expense expense = expenses[index];
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        expense.title,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        expense.amount.toStringAsFixed(2),
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.badge),
                  const SizedBox(width: 20),
                  Text(
                    expense.date.toString(),
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            );
          },
        ));
  }
}
