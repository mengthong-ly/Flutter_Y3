import 'package:flutter/material.dart';

class JokeModel {
  final String title;
  final String description;
  final IconData icon = Icons.favorite;
  bool status;

  JokeModel({
    required this.status,
    required this.title,
    required this.description,
  });
}
