import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const DiceGame());
}

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  String image = 'assets/vichet.jpg';

  void rollDice() {
    int diceValue = Random.secure().nextInt(6) + 1;
    setState(() {
      image = 'assets/dices/dice-$diceValue.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(67, 103, 101, 101),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 200,
                height: 200,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xff606060))),
                  onPressed: rollDice,
                  child: Text(
                    'Roll dice',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
