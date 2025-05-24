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

  const MobileExperiencesTimeline({
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
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: experiences.length,
      separatorBuilder: (context, index) => Center(
        child: SizedBox(
          height: 60,
          child: DottedLine(
            dashColor: lineColor ?? context.colorScheme.primary,
            direction: Axis.vertical,
          ),
        ),
      ),
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
