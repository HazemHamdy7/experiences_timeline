import 'package:experiences_timeline/src/model/experiences_model.dart'
    show ExperienceModel;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'experinenes_state.dart';
import 'package:flutter/material.dart'; // لألوان الـ Flutter

class ExperinenesCubit extends Cubit<ExperinenesState> {
  ExperinenesCubit() : super(ExperinenesState());

  Future<void> fetchExperiences() async {
    emit(Loading());
    try {
      // Fake delay to simulate fetching data
      await Future.delayed(const Duration(seconds: 1));

      // Fake data
      final List<ExperienceModel> experiences = [
        ExperienceModel(
          title: 'Flutter Developer',
          company: 'Awesome Company',
          description: 'Building beautiful mobile apps.',
          date: '2022 - Present',
          color: Colors.blue, // Adding color to each experience
        ),
        ExperienceModel(
          title: 'Backend Developer',
          company: 'Tech Solutions',
          description: 'Working with Python & Django.',
          date: '2020 - 2022',
          color: Colors.green, // Assigning a color to the experience
        ),
      ];

      emit(Loaded(experiences: experiences));
    } catch (e) {
      emit(Error(message: 'Failed to load experiences'));
    }
  }
}
