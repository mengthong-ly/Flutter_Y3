import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/W6/Ex4/data/joke_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JokeApp(),
    );
  }
}

class JokeApp extends StatefulWidget {
  const JokeApp({
    super.key,
  });

  @override
  State<JokeApp> createState() => _JokeAppState();
}

class _JokeAppState extends State<JokeApp> {
  void triggerFav(int index) {
    for (var e in jokeModelData) {
      // e.status = false;
      if (e.status == true) {
        e.status = false;
        break;
      }
    }
    setState(() {
      jokeModelData[index].status = !jokeModelData[index].status;
      favJokeModel = jokeModelData[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: jokeModelData.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
            isFav: jokeModelData[index].status,
            title: jokeModelData[index].title,
            description: jokeModelData[index].description,
            favoriteToggle: () => triggerFav(index),
          );
        },
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final bool isFav;
  final String title;
  final String description;
  final void Function() favoriteToggle;
  const FavoriteCard({
    super.key,
    required this.isFav,
    required this.favoriteToggle,
    required this.title,
    required this.description,
  });

  // late bool currentFav;
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
                    title,
                    style: GoogleFonts.poppins(
                        color: Colors.blue[400], fontWeight: FontWeight.w500),
                  ),
                  Text(
                    description,
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: favoriteToggle,
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
              ),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
