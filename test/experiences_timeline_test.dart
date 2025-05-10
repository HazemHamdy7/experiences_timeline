import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:experiences_timeline/src/model/experiences_model.dart';

void main() {
  group('ExperienceModel', () {
    test('should create an experience with the given properties', () {
      // Arrange
      final experience = ExperienceModel(
        title: 'Title 1',
        company: 'Company 1',
        description: 'Description 1',
        date: '2023-01-01',
        color: Colors.blue,
      );

      // Act & Assert
      expect(experience.title, 'Title 1');
      expect(experience.company, 'Company 1');
      expect(experience.description, 'Description 1');
      expect(experience.date, '2023-01-01');
      expect(experience.color, Colors.blue);
    });
  });
}
