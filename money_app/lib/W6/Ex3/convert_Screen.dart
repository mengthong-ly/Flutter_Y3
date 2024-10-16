import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  final TextEditingController degreeController = TextEditingController();
  @override
  void initState() {
    // i think i use this to make controller listen to the input that i put in and calculate without button
    degreeController.addListener(convertTemperature);
    super.initState();
  }

  @override
  void dispose() {
    degreeController.dispose();
    super.dispose();
  }

  void convertTemperature() {
    // print();
    setState(() {});
    Logger().d("$_temperature °c");
    // degreeController.clear();
  }

  double get _temperature => degreeController.text != ''
      ? (double.tryParse(degreeController.text)! * 9 / 5) + 32
      : 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Convert Page',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.cyan],
          ),
        ),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Icon(
                Icons.cloud,
                size: 80,
                color: Colors.white,
              ),
              Text(
                'Converter',
                style: GoogleFonts.poppins(
                  fontSize: 34,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Temperature in Degrees",
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 5,
              ),
              InputDegree(degreeController: degreeController),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Temperature in Fahrenheit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // InputFarenheit(farenhitController: farenhitController),
              Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  degreeController.text != ''
                      ? "${_temperature.toStringAsFixed(1)}°F"
                      : "0°F",
                  // '',
                  style: GoogleFonts.poppins(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputDegree extends StatelessWidget {
  const InputDegree({
    super.key,
    required this.degreeController,
  });

  final TextEditingController degreeController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: degreeController,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          suffixText: '°c',
          hintText: "Temperature in Degrees",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ));
  }
}
