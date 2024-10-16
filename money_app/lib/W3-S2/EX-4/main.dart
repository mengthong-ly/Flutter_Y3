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
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(30),
            child: Column(
              children: [
                CustomCard(text: 'thong', color: Colors.blue[100]!),
                CustomCard(text: 'thong1', color: Colors.blue[200]!),
                CustomCard(text: 'thong2', color: Colors.blue[300]!),
              ],
            )),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.color, this.text = 'thong', this.gradient});

  final Color? color;
  final String text;
  final LinearGradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: color != null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: color ?? Colors.transparent,
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: gradient ??
                  LinearGradient(
                    colors: [Colors.blue[100]!, Colors.blue[300]!],
                  ),
            ),
      child: Center(
          child: Text(
        'Mengthy',
        style: GoogleFonts.poppins(),
      )),
    );
  }
}
