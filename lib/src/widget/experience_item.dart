import 'package:flutter/material.dart';
import 'package:experiences_timeline/src/model/experiences_model.dart';

class ExperenceItem extends StatelessWidget {
  final ExperienceModel experiences;

  const ExperenceItem({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: experiences.color.withOpacity(0.1), // استخدام اللون هنا
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experiences.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: experiences.color, // استخدام اللون هنا برضو
            ),
          ),
          const SizedBox(height: 4),
          Text(experiences.company, style: TextStyle(color: experiences.color)),
          const SizedBox(height: 8),
          Text(experiences.description),
          const SizedBox(height: 4),
          Text(experiences.date),
        ],
      ),
    );
  }
}
