import 'package:experiences_timeline/src/widget/desktop_experienes_body.dart';
import 'package:experiences_timeline/src/widget/mobile_experienes_body.dart';
import 'package:flutter/material.dart';
import 'package:experiences_timeline/src/widget/extensions.dart';
import 'package:experiences_timeline/src/model/experiences_model.dart';
import 'package:gap/gap.dart';

class ExperiencesTimeline extends StatelessWidget {
  final List<ExperienceModel> experiences;
  final bool enableBorderEffect;
  final double spacing;
  final double? cardWidth;
  final double? cardHeight;
  final EdgeInsets? cardPadding;
  final BorderRadius? cardBorderRadius;
  final Color? lineColor;
  final Color? backgroundColor;
  final double? dotSize;
  final double? dotSpacing;
  final double? lineWidth;
  final bool showDottedLine;

  const ExperiencesTimeline({
    super.key,
    required this.experiences,
    this.enableBorderEffect = true,
    this.spacing = 32,
    this.cardWidth,
    this.cardHeight,
    this.cardPadding,
    this.cardBorderRadius,
    this.lineColor,
    this.backgroundColor,
    this.dotSize = 2.0,
    this.dotSpacing = 4.0,
    this.lineWidth = 1.0,
    this.showDottedLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(spacing),
          context.isDesktop
              ? DesktopExperiencesTimeline(
                  experiences: experiences,
                  cardWidth: cardWidth,
                  cardHeight: cardHeight,
                  cardPadding: cardPadding,
                  cardBorderRadius: cardBorderRadius,
                  lineColor: lineColor,
                )
              : MobileExperiencesTimeline(
                  experiences: experiences,
                  cardWidth: cardWidth,
                  cardHeight: cardHeight,
                  cardPadding: cardPadding,
                  cardBorderRadius: cardBorderRadius,
                  lineColor: lineColor,
                ),
        ],
      ),
    );
  }
}
