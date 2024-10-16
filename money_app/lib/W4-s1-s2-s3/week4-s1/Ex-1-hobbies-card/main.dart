import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyHobbies());
}

class MyHobbies extends StatelessWidget {
  const MyHobbies({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'My Hobbies',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HobbyCard(
                  title: 'Travelling',
                  icon: Icons.travel_explore,
                  color: Colors.green,
                ),
                HobbyCard(
                  title: 'Travelling',
                  icon: Icons.travel_explore,
                ),
                HobbyCard(
                  title: 'Skateboarding',
                  icon: Icons.skateboarding,
                  color: Colors.black87,
                ),
              ],
            ),
          )),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const HobbyCard(
      {super.key,
      required this.title,
      required this.icon,
      this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      height: 80,
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 10),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                  color: const Color(0xfff4f4f4), fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
