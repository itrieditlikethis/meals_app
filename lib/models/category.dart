import 'package:flutter/material.dart';

const defaultGridItemColor = Color.fromARGB(255, 165, 0, 0);

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    this.color = defaultGridItemColor,
  });
}
