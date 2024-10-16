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
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Weather(),
    );
  }
}

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WeatherCard(
              initailWeather: 1,
              country: 'Cambodia',
            ),
            WeatherCard(
              initailWeather: 1,
              country: 'Franch',
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatefulWidget {
  final int initailWeather;
  final String country;
  const WeatherCard(
      {super.key, required this.initailWeather, required this.country});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  int currentWeather = 1;

  void triggerSeason() {
    setState(() {
      currentWeather = (currentWeather % 4) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: triggerSeason,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              color: Colors.amber,
            ),
            width: 200,
            height: 300,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.asset(
                  'assets/weather/weath-$currentWeather.jpeg',
                  fit: BoxFit.fill,
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.country,
          style: GoogleFonts.poppins(),
        )
      ],
    );
  }
}
