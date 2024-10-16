import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/W4-s1-s2-s3/week4-S1/Ex-3-custom-button/button_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Custom button',
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 40),
              const CustomButton(
                label: 'Submit',
                icon: Icons.check,
              ),
              const SizedBox(height: 10),
              const CustomButton(
                label: 'Time',
                alignment: IconAlignment.end,
                buttonType: ButtonType.secondary,
                icon: Icons.check,
              ),
              const SizedBox(height: 10),
              const CustomButton(
                label: 'Account',
                alignment: IconAlignment.end,
                buttonType: ButtonType.disabled,
                icon: Icons.account_tree_rounded,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final String label;
  final IconData icon;
  final IconAlignment alignment;
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.alignment = IconAlignment.start,
    this.buttonType = ButtonType.primary,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        iconColor: const WidgetStatePropertyAll(Colors.white),
        backgroundColor: WidgetStatePropertyAll(buttonType.color),
      ),

      onPressed: buttonType == ButtonType.disabled ? null : () {},
      iconAlignment: alignment,
      
      label: Text(
        label,
        style: GoogleFonts.poppins(
            color: buttonType == ButtonType.disabled
                ? const Color.fromARGB(255, 86, 86, 86)
                : Colors.white),
      ),
      icon: Icon(
        icon,
        color: buttonType == ButtonType.disabled
            ? const Color.fromARGB(255, 86, 86, 86)
            : Colors.white,
      ),
    );
  }
}
