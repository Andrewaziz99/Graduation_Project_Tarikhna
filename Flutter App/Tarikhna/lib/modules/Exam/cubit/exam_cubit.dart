import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'exam_state.dart';

class ExamCubit extends Cubit<ExamState> {
  ExamCubit() : super(ExamInitial());
  int selectedIndex = -1;
  Future<void> updateindex(int newIndex) async {
    emit(ChooseExam()..setSelectedIndex(newIndex));
  }

  // void update() {
  //   emit(chooseExamLevel());
  // }
  // void updateindex(int newIndex) {
  //   emit(ChooseExam()..setSelectedIndex(newIndex));
  //   //emit(chooseExamLevel());
  //   // setState(() {
  //   //   _selectedButtonIndex = newIndex;
  //   // });
  // }
}
