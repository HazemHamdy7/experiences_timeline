import 'package:dotted_line/dotted_line.dart';
import 'package:experiences_timeline/src/model/experiences_model.dart';
import 'package:experiences_timeline/src/widget/experence_item.dart';
import 'package:experiences_timeline/src/widget/extensions.dart';
import 'package:flutter/material.dart';

class MobileExperiencesTimeline extends StatelessWidget {
  final List<ExperienceModel> experiences;
  final double? cardWidth;
  final double? cardHeight;
  final EdgeInsets? cardPadding;
  final BorderRadius? cardBorderRadius;
  final Color? lineColor;
  final double? dotSize;
  final double? dotSpacing;
  final double? lineWidth;
  final bool showDottedLine;

  const MobileExperiencesTimeline({
    super.key,
    required this.experiences,
    this.cardWidth,
    this.cardHeight,
    this.cardPadding,
    this.cardBorderRadius,
    this.lineColor,
    this.dotSize = 2.0,
    this.dotSpacing = 4.0,
    this.lineWidth = 1.0,
    this.showDottedLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: experiences.length,
      separatorBuilder: (context, index) => showDottedLine ? Center(
        child: SizedBox(
          height: 60,
          child: DottedLine(
            dashColor: lineColor ?? context.colorScheme.primary,
            direction: Axis.vertical,
            lineThickness: lineWidth ?? 1.0,
            dashLength: dotSize ?? 2.0,
            dashGapLength: dotSpacing ?? 4.0,
          ),
        ),
      ) : const SizedBox(height: 60),
      itemBuilder: (context, index) => ExperienceItem(
        experienceModel: experiences[index],
        width: cardWidth,
        height: cardHeight,
        padding: cardPadding,
        borderRadius: cardBorderRadius,
      ),
    );
  }
}
