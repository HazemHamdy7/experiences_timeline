import 'package:flutter/material.dart';
import 'package:experiences_timeline/experiences_timeline.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ExperiencesTimeline(
            experiences: [
              ExperienceModel(
                title: 'Software Engineer',
                company: 'Tech Corp',
                description: 'Developed innovative solutions...',
                date: '2022 - Present',
                color: Colors.red,
              ),
              ExperienceModel(
                title: 'Junior Developer',
                company: 'Startup Inc',
                description: 'Worked on mobile applications...',
                date: '2020 - 2022',
                color: Colors.blue,
              ),
            ],
            cardWidth: 300,
            cardHeight: 200,
            cardPadding: EdgeInsets.all(16),
            cardBorderRadius: BorderRadius.circular(12),
            lineColor: Colors.blue,
            dotSize: 2.0,
            dotSpacing: 4.0,
            lineWidth: 1.0,
            showDottedLine: true,
          ),
        ),
      ),
    );
  }
}
