import 'package:flutter/material.dart';
import 'package:money_app/W6/Ex3/convert_Screen.dart';
import 'package:money_app/W6/Ex3/welcome_screen.dart';

class TemperatureConverterApp extends StatefulWidget {
  const TemperatureConverterApp({super.key});

  @override
  State<TemperatureConverterApp> createState() =>
      _TemperatureConverterAppState();
}

class _TemperatureConverterAppState extends State<TemperatureConverterApp> {
  bool isActive = true;
  void toggleScreen() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isActive
        ? WelcomeScreen(
            onTrigger: toggleScreen,
          )
        : const ConvertScreen();
  }
}
