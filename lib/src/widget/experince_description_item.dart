import 'package:experiences_timeline/src/model/experiences_model.dart';
import 'package:experiences_timeline/src/widget/extensions.dart';
import 'package:flutter/material.dart';

class ExperienceDescriptionItem extends StatelessWidget {
  final ExperienceModel experiencesModel;

  const ExperienceDescriptionItem({super.key, required this.experiencesModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.onSurface,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            experiencesModel.description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
