import 'package:experiences_timeline/src/experiences_timeline.dart';
import 'package:experiences_timeline/src/extensions.dart';
import 'package:experiences_timeline/src/widget/experience_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotted_line/dotted_line.dart';

const expScaleFactor = 150.0;
const expPointsSize = 16.0;
const expPonitFactor = 230 / 2 - expPointsSize / 2;

class DesktopExperiencesBody extends StatelessWidget {
  const DesktopExperiencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return BlocProvider(
      create: (context) => ExperinenesCubit()..fetchExperiences(),
      child: BlocBuilder<ExperinenesCubit, ExperinenesState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: Text(state.message));
          } else if (state is Loaded) {
            final experiences = state.experiences;
            return Container(
              alignment: Alignment.center,
              height: experiences.length * expScaleFactor + expScaleFactor,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 3,
                      height:
                          experiences.length * expScaleFactor + expScaleFactor,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: isArabic
                              ? [
                                  SizedBox(
                                    width: 100,
                                    child: DottedLine(
                                        dashColor: context.colorScheme.primary),
                                  ),
                                  ExperenceItem(experiences: experiences[i]),
                                ]
                              : [
                                  ExperenceItem(experiences: experiences[i]),
                                  SizedBox(
                                    width: 100,
                                    child: DottedLine(
                                        dashColor: context.colorScheme.primary),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: isArabic
                              ? [
                                  ExperenceItem(experiences: experiences[i]),
                                  SizedBox(
                                    width: 100,
                                    child: DottedLine(
                                        dashColor: context.colorScheme.primary),
                                  ),
                                ]
                              : [
                                  SizedBox(
                                    width: 100,
                                    child: DottedLine(
                                        dashColor: context.colorScheme.primary),
                                  ),
                                  ExperenceItem(experiences: experiences[i]),
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
                          color: context.colorScheme.onBackground
                              .withOpacity(0.24),
                        ),
                        child: Container(
                          width: expPointsSize / 2,
                          height: expPointsSize / 2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.colorScheme.onBackground
                                .withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            );
          } else {
            throw UnimplementedError();
          }
        },
      ),
    );
  }
}
