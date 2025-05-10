import 'package:dotted_line/dotted_line.dart';
import 'package:experiences_timeline/src/model/experiences_model.dart';
import 'package:experiences_timeline/src/widget/experence_item.dart';
import 'package:experiences_timeline/src/widget/extensions.dart';
import 'package:flutter/material.dart';

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

const expLen = 6;
const expPointsSize = 16.0;
const expScaleFactor = 150.0;
const expPonitFactor = 230 / 2 - expPointsSize / 2;

class DesktopExperiencesTimeline extends StatelessWidget {
  const DesktopExperiencesTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Stack(
      children: [
        Center(
          child: Container(
            width: 3,
            height: experiences.length * expScaleFactor + expScaleFactor,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.primary.withOpacity(0),
                  context.colorScheme.primary,
                  context.colorScheme.primary.withOpacity(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        for (int i = 0; i < experiences.length; i++) ...[
          if (i.isEven)
            Positioned(
              top: i * expScaleFactor,
              right: 400,
              left: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ExperienceItem(experienceModel: experiences[i]),

                  SizedBox(
                    width: 100,
                    child: DottedLine(dashColor: context.colorScheme.primary),
                  ),
                ],
              ),
            )
          else
            Positioned(
              top: i * expScaleFactor,
              left: 400,
              right: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    isArabic
                        ? [
                          ExperienceItem(experienceModel: experiences[i]),

                          SizedBox(
                            width: 100,
                            child: DottedLine(
                              dashColor: context.colorScheme.primary,
                            ),
                          ),
                        ]
                        : [
                          SizedBox(
                            width: 100,
                            child: DottedLine(
                              dashColor: context.colorScheme.primary,
                            ),
                          ),
                          ExperienceItem(experienceModel: experiences[i]),
                        ],
              ),
            ),
          Positioned(
            top: i * expScaleFactor + expPonitFactor,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              width: expPointsSize,
              height: expPointsSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.onBackground.withOpacity(0.24),
              ),
              child: Container(
                width: expPointsSize / 2,
                height: expPointsSize / 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.onBackground.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
