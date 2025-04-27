import 'package:flutter/material.dart'; // لاستيراد الألوان

class ExperienceModel {
  final String title;
  final String company;
  final String description;
  final String date;
  final Color color; // خاصية جديدة للألوان

  ExperienceModel({
    required this.title,
    required this.company,
    required this.description,
    required this.date,
    required this.color, // تعيين اللون
  });
}
