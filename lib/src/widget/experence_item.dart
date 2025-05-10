import 'package:experiences_timeline/src/model/experiences_model.dart';
import 'package:experiences_timeline/src/widget/experince_description_item.dart';
import 'package:experiences_timeline/src/widget/extensions.dart';
import 'package:experiences_timeline/src/widget/styled_card.dart';
import 'package:flutter/material.dart';

class ExperienceItem extends StatelessWidget {
  final ExperienceModel experienceModel;

  const ExperienceItem({super.key, required this.experienceModel});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'en';
    return StyledCard(
      width: 330,
      height: 230,
      borderEffect: true,
      child: Card(
        child: Column(
          children: [
            Text(
              experienceModel.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onBackground,
              ),
              textAlign: isArabic ? TextAlign.right : TextAlign.left,
            ),
            Expanded(
              child: Column(
                children: [
                  ExperienceDescriptionItem(experiencesModel: experienceModel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
