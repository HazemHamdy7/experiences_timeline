import 'package:dotted_line/dotted_line.dart';
import 'package:experiences_timeline/src/model/experiences_model.dart';
import 'package:experiences_timeline/src/widget/experence_item.dart';
import 'package:experiences_timeline/src/widget/extensions.dart';
import 'package:flutter/material.dart';

const expPointsSize = 16.0;
const expScaleFactor = 150.0;
const expPonitFactor = 230 / 2 - expPointsSize / 2;

class DesktopExperiencesTimeline extends StatelessWidget {
  final List<ExperienceModel> experiences;
  final double? cardWidth;
  final double? cardHeight;
  final EdgeInsets? cardPadding;
  final BorderRadius? cardBorderRadius;
  final Color? lineColor;

  const DesktopExperiencesTimeline({
    super.key,
    required this.experiences,
    this.cardWidth,
    this.cardHeight,
    this.cardPadding,
    this.cardBorderRadius,
    this.lineColor,
  });

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
                  (lineColor ?? context.colorScheme.primary).withValues(alpha: 0),
                  lineColor ?? context.colorScheme.primary,
                  (lineColor ?? context.colorScheme.primary).withValues(alpha: 0),
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
                  ExperienceItem(
                    experienceModel: experiences[i],
                    width: cardWidth,
                    height: cardHeight,
                    padding: cardPadding,
                    borderRadius: cardBorderRadius,
                  ),
                  SizedBox(
                    width: 100,
                    child: DottedLine(dashColor: lineColor ?? context.colorScheme.primary),
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
                children: isArabic
                    ? [
                        ExperienceItem(
                          experienceModel: experiences[i],
                          width: cardWidth,
                          height: cardHeight,
                          padding: cardPadding,
                          borderRadius: cardBorderRadius,
                        ),
                        SizedBox(
                          width: 100,
                          child: DottedLine(dashColor: lineColor ?? context.colorScheme.primary),
                        ),
                      ]
                    : [
                        SizedBox(
                          width: 100,
                          child: DottedLine(dashColor: lineColor ?? context.colorScheme.primary),
                        ),
                        ExperienceItem(
                          experienceModel: experiences[i],
                          width: cardWidth,
                          height: cardHeight,
                          padding: cardPadding,
                          borderRadius: cardBorderRadius,
                        ),
                      ],
              ),
            ),
          // Point indicator
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
                color: (lineColor ?? context.colorScheme.onSurface).withValues(alpha: 0.24),
              ),
              child: Container(
                width: expPointsSize / 2,
                height: expPointsSize / 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lineColor ?? context.colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
