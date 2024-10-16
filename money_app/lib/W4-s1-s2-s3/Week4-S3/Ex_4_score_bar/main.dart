import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final double high = 200;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            Card(
              high: high,
              label: "Flutter Score",
            ),
            const SizedBox(
              height: 30,
            ),
            Card(high: high, label: "Dart Score"),
            const SizedBox(
              height: 30,
            ),
            Card(
              high: high,
              label: "Firebase Score",
            ),
          ],
        ),
      ),
    );
  }
}

class Card extends StatefulWidget {
  final double high;
  final String label;
  const Card({
    super.key,
    required this.label,
    required this.high,
  });

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  late double barWidth;
  double maxWidth = 400;

  @override
  void initState() {
    barWidth = 0;
    super.initState();
  }

  void increaseScore() {
    setState(() {
      if (barWidth < maxWidth) barWidth += 100;
    });
  }

  void decreaseScore() {
    setState(() {
      if (barWidth > 0) barWidth -= 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      height: widget.high,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.label,
            style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: decreaseScore,
                icon: const Icon(Icons.navigate_before),
              ),
              IconButton(
                onPressed: increaseScore,
                icon: const Icon(Icons.navigate_next),
              ),
            ],
          ),
          Container(
            width: maxWidth,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: barWidth,
                decoration: BoxDecoration(
                    color: Colors.green[barWidth.floor()],
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
