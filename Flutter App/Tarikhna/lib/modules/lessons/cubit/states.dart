import 'package:tarikhna/models/lesson_model.dart';

abstract class LessonsState {}

class LessonsInitialState extends LessonsState {}

class LessonsLoadingState extends LessonsState {}

class LessonsSuccessState extends LessonsState {
  final LessonModel lesson;

  LessonsSuccessState(this.lesson);
}

class LessonsErrorState extends LessonsState {
  final String error;

  LessonsErrorState(this.error);
}

class LessonsSearchLoadingState extends LessonsState {}

class LessonsSearchSuccessState extends LessonsState {
  final LessonModel lesson;

  LessonsSearchSuccessState(this.lesson);
}

class LessonsSearchErrorState extends LessonsState {
  final String error;

  LessonsSearchErrorState(this.error);
}

// class OpenARWidgetState extends LessonsState {}
