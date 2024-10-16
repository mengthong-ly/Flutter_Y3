import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  final void Function() triggerWelcome;
  final String quizTitle;
  const WelcomePage({
    super.key,
    required this.triggerWelcome,
    required this.quizTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/flutter_white.png',
              width: 160,
              height: 160,
            ),
            const SizedBox(height: 20),
            Text(
              quizTitle,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            FilledButton(
              onPressed: triggerWelcome,
              style: FilledButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                'start quiz',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[400],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
