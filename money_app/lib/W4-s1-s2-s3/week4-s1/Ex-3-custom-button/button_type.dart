import 'package:flutter/material.dart';

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;
    
  const ButtonType(this.color);
}
