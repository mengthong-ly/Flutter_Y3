import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const Scaffold(
          body: Mycard(),
        ));
  }
}

class Mycard extends StatefulWidget {
  const Mycard({super.key});
  final double price = 100;

  @override
  State<Mycard> createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  final double width = 500;
  bool isActive = false;

  void triggerDiscount() {
    print('object');
    print(isActive);
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    String pricelabel = isActive ? "${widget.price}" : "${widget.price - 25}";
    String discountStatusLabel = isActive ? "not Discount" : "Discount";
    Color backgroundColor = isActive ? Colors.grey : Colors.pink;
    return SafeArea(
      child: SizedBox(
        width: width,
        height: width * 9 / 16,
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(pricelabel, style: const TextStyle(fontSize: 24)),
                Text(discountStatusLabel, style: const TextStyle(fontSize: 24)),
                TextButton(
                  onPressed: triggerDiscount,
                  child: const Text('ApplyDiscount?'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
