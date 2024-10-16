import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            CustomBestCard(
              isFav: true,
            ),
            CustomBestCard(
              isFav: false,
            ),
            CustomBestCard(
              isFav: true,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBestCard extends StatefulWidget {
  final bool isFav;
  const CustomBestCard({super.key, required this.isFav});

  @override
  State<CustomBestCard> createState() => _CustomBestCardState();
}

class _CustomBestCardState extends State<CustomBestCard> {
  late bool currentFav;

  @override
  void initState() {
    currentFav = widget.isFav;
    super.initState();
  }

  void triggerFav() {
    setState(() {
      currentFav = !currentFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.4,
            color: Colors.black,
          ),
        ),
      ),
      width: double.infinity,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "title",
                    style: GoogleFonts.poppins(
                        color: Colors.blue[400], fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "description",
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: triggerFav,
              icon: Icon(currentFav ? Icons.favorite : Icons.favorite_border),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
