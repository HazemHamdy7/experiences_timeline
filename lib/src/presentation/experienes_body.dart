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

  const ExperiencesTimeline({
    super.key,
    required this.experiences,
    this.enableBorderEffect = true,
    this.spacing = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(spacing),
        context.isDesktop
            ? DesktopExperiencesTimeline()
            : MobileExperiencesTimeline(experiences: [...experiences]),
      ],
    );
  }
}
