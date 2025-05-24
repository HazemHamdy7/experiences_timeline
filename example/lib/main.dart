import 'package:flutter/material.dart';
import 'package:experiences_timeline/experiences_timeline.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiences Timeline Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Experiences Timeline'),
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ExperiencesTimeline(
              experiences: [
                ExperienceModel(
                  title: 'UI/UX Designer',
                  company: 'Design Studio',
                  description: 'Worked on various projects',
                  date: '2023 - Present',
                  color: Colors.purple.shade50, // Change cardColor to color
                  dateStyle: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                ExperienceModel(
                  title: 'UI/UX Designer',
                  company: 'Design Studio',
                  description: 'Worked on various projects',
                  date: '2023 - Present',
                  color: Colors.purple.shade50, // Change cardColor to color
                  dateStyle: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
              // Customization options
              cardWidth: 300,
              cardHeight: 200,
              cardPadding: const EdgeInsets.all(16),
              cardBorderRadius: BorderRadius.circular(20),
              lineColor: Colors.purple,
              dotSize: 4.0,
              dotSpacing: 4.0,
              lineWidth: 2.0,
              showDottedLine: true,
              backgroundColor: Colors.blue,
              enableBorderEffect: true,
              // This will center the line in mobile view
            ),
          ),
        ),
      ),
    );
  }
}
