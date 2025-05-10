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

// تعريف قائمة الـ experiences
final List<ExperienceModel> experiences = [
  ExperienceModel(
    title: 'Title 1',
    company: 'Company 1',
    description: 'Description 1',
    date: '2023-01-01',
    color: Colors.blue,
  ),
  ExperienceModel(
    title: 'Title 2',
    company: 'Company 2',
    description: "Description 2",
    date: '2023-02-01',
    color: Colors.green,
  ),
  // أضف باقي العناصر هنا
];
