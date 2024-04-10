part of 'exam_cubit.dart';

@immutable
sealed class ExamState {}

class ExamInitial extends ExamState {}

class ChooseExam extends ExamState {
  late int selectedIndex;
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }
}

class chooseExamLevel extends ExamState {}
