import 'package:dotted_line/dotted_line.dart';
import 'package:experiences_timeline/src/model/experiences_model.dart';
import 'package:experiences_timeline/src/widget/experence_item.dart';
import 'package:experiences_timeline/src/widget/extensions.dart';
import 'package:flutter/material.dart';

class MobileExperiencesTimeline extends StatelessWidget {
  final List<ExperienceModel> experiences;

  const MobileExperiencesTimeline({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: experiences.length,
      separatorBuilder:
          (context, index) => Center(
            child: SizedBox(
              height: 60,
              child: DottedLine(
                dashColor: context.colorScheme.primary,
                direction: Axis.vertical,
              ),
            ),
          ),
      itemBuilder: (context, index) {
        return Center(
          child: ExperienceItem(experienceModel: experiences[index]),
        );
      },
    );
  }
}
