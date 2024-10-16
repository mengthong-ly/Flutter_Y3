import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/W4-s1-s2-s3/week4-S1/Ex-4-weather/weather_type.dart';

void main() {
  runApp(const WeatherForecast());
}

List<WeatherCast> weathers = [
  const WeatherCast(
    type: WeatherType.cloud,
    day: 'Sun',
  ),
  const WeatherCast(
    type: WeatherType.rain,
    day: 'Mon',
  ),
  const WeatherCast(
    type: WeatherType.rainfall,
    day: 'Tue',
  ),
  const WeatherCast(
    type: WeatherType.sunrise,
    day: 'Wed',
  ),
  const WeatherCast(
    type: WeatherType.thunderstorm,
    day: 'Thu',
  ),
  const WeatherCast(
    type: WeatherType.snow,
    day: 'Fri',
  ),
  const WeatherCast(
    type: WeatherType.snow,
    day: 'Sat',
  ),
  const WeatherCast(
    type: WeatherType.rain,
    day: 'Sun',
  ),
  const WeatherCast(
    type: WeatherType.sunrise,
    day: 'Mon',
  ),
];

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xfff4f4f4),
        appBar: AppBar(
          backgroundColor: const Color(0xfff4f4f4),
          elevation: 0,
          title: Text(
            'Weather',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            buildWeatherCard(context),
            const Spacer(),
            Text(
              'Today',
              style: GoogleFonts.poppins(),
            ),
            Text(
              '40°',
              style: GoogleFonts.poppins(
                  fontSize: 120,
                  fontWeight: FontWeight.w100,
                  color: const Color.fromARGB(125, 0, 0, 0)),
            ),
            const Spacer(),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(18, 48, 48, 48),
                      spreadRadius: 10,
                      offset: Offset(0, 1),
                      blurRadius: 20,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(38),
                      topLeft: Radius.circular(38))),
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, bottom: 15, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Live Weather',
                          style: GoogleFonts.poppins(
                              fontSize: 21, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'View All >',
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 20),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: weathers,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildWeatherCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(17, 0, 0, 0),
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(14))),
      width: MediaQuery.of(context).size.width,
      height: 300 * 9 / 21,
      child: Row(
        children: [
          const SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cambodia,',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 86, 86, 86),
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Phnom Penh',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 86, 86, 86),
                ),
              ),
            ],
          ),
          const SizedBox(width: 80),
          const Icon(
            Icons.location_city_rounded,
            size: 100,
            color: Color.fromARGB(255, 86, 86, 86),
          )
        ],
      ),
    );
  }
}

class WeatherCast extends StatelessWidget {
  final WeatherType type;
  final String day;
  const WeatherCast(
      {super.key, this.type = WeatherType.sunrise, required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(60, 0, 0, 0)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      width: 100,
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: GoogleFonts.poppins(),
          ),
          Text(
            type.icon,
            style: const TextStyle(fontSize: 35),
          ),
          RichText(
            text: TextSpan(
                text: '${type.higestCelsius}-',
                style: GoogleFonts.poppins(color: Colors.black),
                children: [
                  TextSpan(
                      text: type.lowestCelsius,
                      style: GoogleFonts.poppins(
                          color: const Color.fromARGB(120, 0, 0, 0)))
                ]),
          )
        ],
      ),
    );
  }
}
