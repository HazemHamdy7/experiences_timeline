import 'package:experiences_timeline/src/model/experiences_model.dart';
import 'package:experiences_timeline/src/widget/experince_description_item.dart';
import 'package:experiences_timeline/src/widget/extensions.dart';
import 'package:experiences_timeline/src/widget/styled_card.dart';
import 'package:flutter/material.dart';

class ExperienceItem extends StatelessWidget {
  final ExperienceModel experienceModel;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  const ExperienceItem({
    super.key,
    required this.experienceModel,
    this.width = 330,
    this.height = 230,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'en';
    return StyledCard(
      width: width,
      height: height,
      padding: padding,
      borderRadius: borderRadius,
      borderEffect: true,
      child: Card(
        child: Column(
          children: [
            Text(
              experienceModel.title,
              style:
                  experienceModel.titleStyle ??
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: context.colorScheme.onSurface,
                  ),
              textAlign: isArabic ? TextAlign.right : TextAlign.left,
            ),
            Expanded(
              child: Column(
                children: [
                  ExperienceDescriptionItem(experiencesModel: experienceModel),

                  Text(
                    experienceModel.date,
                    style:
                        experienceModel.dateStyle ??
                        TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: context.colorScheme.onSurface,
                        ),
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  ),
                  Text(
                    experienceModel.company,
                    style:
                        experienceModel.companyStyle ??
                        TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: context.colorScheme.onSurface,
                        ),
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
