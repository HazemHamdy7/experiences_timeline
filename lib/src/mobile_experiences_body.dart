import 'package:dotted_line/dotted_line.dart';
import 'package:experiences_timeline/src/cubit/experinenes_cubit.dart';
import 'package:experiences_timeline/src/cubit/experinenes_state.dart';
import 'package:experiences_timeline/src/experiences_timeline.dart';
import 'package:experiences_timeline/src/extensions.dart';
import 'package:experiences_timeline/src/widget/experience_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
class MobileExperienesBody extends StatelessWidget {
  const MobileExperienesBody({super.key});

  @override
  Widget build(BuildContext context) {
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
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16.0),
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
                  child: ExperenceItem(experiences: experiences[index]),
                );
              },
            );
          }
          return const Center(child: Text('Unexpected state'));
        },
      ),
    );
  }
}
