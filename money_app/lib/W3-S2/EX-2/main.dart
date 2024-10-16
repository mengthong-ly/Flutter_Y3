import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.blue[100],
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(40),
            child: Center(
              child: Text(
                "long mengthythy",
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
