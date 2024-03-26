import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/quiz/cubit/states.dart';

class QuizCubit extends Cubit<QuizStates> {
  QuizCubit() : super(QuizInitialState());

  static QuizCubit get(context) => BlocProvider.of(context);

  String? selectedOption;

  void changeSelectedOption(value){
    selectedOption = value;
    emit(QuizChangeSelectedOptionState());
  }

  void getQuiz() {
    emit(QuizLoadingState());
  }
}
