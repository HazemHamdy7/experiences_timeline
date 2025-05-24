import 'package:flutter/material.dart';

class ExperienceModel {
  final String title;
  final String company;
  final String description;
  final String date;
  final Color color;
  final TextStyle? titleStyle;
  final TextStyle? companyStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? dateStyle;

  ExperienceModel({
    required this.title,
    required this.company,
    required this.description,
    required this.date,
    required this.color,
    this.titleStyle,
    this.companyStyle,
    this.descriptionStyle,
    this.dateStyle,
  });
}
