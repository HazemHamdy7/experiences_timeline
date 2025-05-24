import 'package:experiences_timeline/src/model/experiences_model.dart';
import 'package:experiences_timeline/src/widget/extensions.dart';
import 'package:flutter/material.dart';

class ExperienceDescriptionItem extends StatelessWidget {
  final ExperienceModel experiencesModel;
  final bool showDot;
  final double dotSize;
  final Color? dotColor;

  const ExperienceDescriptionItem({
    super.key,
    required this.experiencesModel,
    this.showDot = true,
    this.dotSize = 4.0,
    this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showDot)
          Container(
            width: dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dotColor ?? context.colorScheme.onSurface,
            ),
          ),
        SizedBox(width: showDot ? 8 : 0),
        Expanded(
          child: Text(
            experiencesModel.description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: experiencesModel.descriptionStyle ?? TextStyle(
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
