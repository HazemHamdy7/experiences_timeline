import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:experiences_timeline/src/experiences_timeline.dart';
import 'package:experiences_timeline/src/cubit/experinenes_cubit.dart';
import 'package:experiences_timeline/src/cubit/experinenes_state.dart';
import 'package:experiences_timeline/src/model/experiences_model.dart';
 
void main() {
  group('ExperinenesCubit Tests', () {
    // اختبار أن الـ Cubit يبدأ بـ Loading
    test('Should emit Loading state initially', () {
      final cubit = ExperinenesCubit();
      expect(cubit.state, isA<Loading>());
    });

    // اختبار عندما يتم استدعاء fetchExperiences، يجب أن يصدر Loaded مع الخبرات
    test(
      'Should emit Loaded state with experiences when fetchExperiences is called',
      () async {
        final cubit = ExperinenesCubit();
        final experiences = [
          ExperienceModel(
            title: 'Flutter Developer',
            company: 'Awesome Company',
            description: 'Building beautiful mobile apps.',
            date: '2022 - Present',
            color: Colors.blue,
          ),
          ExperienceModel(
            title: 'Backend Developer',
            company: 'Tech Solutions',
            description: 'Working with Python & Django.',
            date: '2020 - 2022',
            color: Colors.green,
          ),
        ];

        // محاكاة استدعاء fetchExperiences
        await cubit.fetchExperiences();

        expect(cubit.state, isA<Loaded>());
        final loadedState = cubit.state as Loaded;

        // تحقق من أن البيانات التي تم تحميلها تتطابق مع البيانات المتوقعة
        expect(loadedState.experiences.length, experiences.length);
        for (int i = 0; i < experiences.length; i++) {
          expect(loadedState.experiences[i], experiences[i]);
        }
      },
    );

    testWidgets('Displays experiences when Loaded state is emitted', (
      WidgetTester tester,
    ) async {
      final experiences = [
        ExperienceModel(
          title: 'Flutter Developer',
          company: 'Awesome Company',
          description: 'Building beautiful mobile apps.',
          date: '2022 - Present',
          color: Colors.blue,
        ),
        ExperienceModel(
          title: 'Backend Developer',
          company: 'Tech Solutions',
          description: 'Working with Python & Django.',
          date: '2020 - 2022',
          color: Colors.green,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ExperinenesCubit>(
            create:
                (context) =>
                    ExperinenesCubit()..emit(Loaded(experiences: experiences)),
            child: Scaffold(
              body: ExperiencesTimeline(
                experiences: experiences,
                isArabic: false,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // تحقق من أن كل تجربة يتم عرضها بشكل صحيح
      for (final experience in experiences) {
        expect(find.text(experience.title), findsOneWidget);
        expect(find.text(experience.company), findsOneWidget);
        expect(find.text(experience.date), findsOneWidget);
        expect(find.text(experience.description), findsOneWidget);
      }
    });

    testWidgets('Displays loading indicator when state is Loading', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ExperinenesCubit>(
            create: (context) => ExperinenesCubit()..emit(Loading()),
            child: Scaffold(
              body: ExperiencesTimeline(experiences: [], isArabic: false),
            ),
          ),
        ),
      );

      // تحقق من أن مؤشر التحميل يظهر عندما يكون في حالة Loading
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Displays error message when state is Error', (
      WidgetTester tester,
    ) async {
      const errorMessage = 'Failed to load experiences';

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ExperinenesCubit>(
            create:
                (context) =>
                    ExperinenesCubit()..emit(Error(message: errorMessage)),
            child: Scaffold(
              body: ExperiencesTimeline(experiences: [], isArabic: false),
            ),
          ),
        ),
      );

      // تحقق من عرض رسالة الخطأ عندما يكون في حالة Error
      expect(find.text(errorMessage), findsOneWidget);
    });
  });
}
