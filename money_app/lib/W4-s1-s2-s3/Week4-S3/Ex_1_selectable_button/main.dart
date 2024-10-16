import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SafeArea(
            child: Column(
              children: [
                MyButton(),
                SizedBox(height: 20,),
                MyButton(),
                SizedBox(height: 20,),
                MyButton(),
                SizedBox(height: 20,),
                MyButton(),
                SizedBox(height: 20,),
                MyButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isSelected = false;

  String get text => isSelected ? "Not select" : "Selected";
  Color? get backgroundColor =>!isSelected ? Colors.blue[500] : Colors.blue[50];
  Color? get color => !isSelected ? Colors.white : Colors.black;

  void triggerButton() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor, foregroundColor: color),
        // backgroundColor: WidgetStatePropertyAll(
        //     !isSelected ? Colors.blue[500] : Colors.blue[50])),
        onPressed: triggerButton,
        child: Text(text),
      ),
    );
  }
}
