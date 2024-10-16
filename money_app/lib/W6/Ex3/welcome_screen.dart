import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onTrigger});
  // final VoidCallback onTrigger;
  final void Function() onTrigger;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // color: Colors.blue[500]
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.blue,
              Colors.cyan,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.cloud,
                size: 60,
                color: Colors.white,
              ),
              Text(
                "Welcome",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 34,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: onTrigger,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white)),
                  child: Text(
                    "Start to Convert",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
