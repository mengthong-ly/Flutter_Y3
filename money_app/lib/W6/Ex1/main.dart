import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mengthong',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PraticeWidget(),
    );
  }
}

class PraticeWidget extends StatelessWidget {
  PraticeWidget({super.key});
  final List<String> element = [
    "red",
    "blue",
    "green",
  ];

  List<Widget> getColor() {
    return element.map((e) => Text(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ex 1
          // for (int i = 0; i < 10; i++) Text("$i"),

          //ex2
          ...element.map((e) => Text(e)) // [sdfsfsdfsfd,sdfsd,sdfsdf]

          //ex3
          // ...getColor()
        ],
      ),
    );
  }
}
