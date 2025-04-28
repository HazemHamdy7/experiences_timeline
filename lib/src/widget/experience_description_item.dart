import 'package:experiences_timeline/src/extensions.dart';
import 'package:flutter/material.dart';
 
class ExperienceDescriptionItem extends StatelessWidget {
  final String title;
  final String description;
  final String period;

  const ExperienceDescriptionItem({
    super.key,
    required this.title,
    required this.description,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: context.colorScheme.surface,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text(period, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: context.colorScheme.primary)),
          ],
        ),
      ),
    );
  }
}
