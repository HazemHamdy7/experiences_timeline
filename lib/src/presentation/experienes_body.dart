import 'package:experiences_timeline/src/experiences_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExperienesBody extends StatelessWidget {
  const ExperienesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(32),
        context.isDesktop
            ? const DesktopExperiencesBody()
            : const MobileExperienesBody(),
      ],
    );
  }
}
