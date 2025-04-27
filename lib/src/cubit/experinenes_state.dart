import 'package:experiences_timeline/src/model/experiences_model.dart';

class ExperinenesState {}

class Loading extends ExperinenesState {}

class Error extends ExperinenesState {
  final String message;

  Error({required this.message});
}

class Loaded extends ExperinenesState {
  final List<ExperienceModel> experiences;

  Loaded({required this.experiences});
}
