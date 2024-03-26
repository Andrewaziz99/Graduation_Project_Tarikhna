import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/models/Quiz_model.dart';
import 'package:tarikhna/modules/quiz/cubit/states.dart';
import 'package:tarikhna/shared/components/constants.dart';
import 'package:tarikhna/shared/network/local/cache_helper.dart';
import 'package:tarikhna/shared/network/remote/dio_helper.dart';

class QuizCubit extends Cubit<QuizStates> {
  QuizCubit() : super(QuizInitialState());

  static QuizCubit get(context) => BlocProvider.of(context);

  int? selectedOption = 5;

  void changeSelectedOption(value) {
    selectedOption = value;
    emit(QuizChangeSelectedOptionState());
  }

  QuizModel? quizModel;

  void getQuiz(LId) {
    emit(QuizLoadingState());
    DioHelper.getData(
      url: QUIZ,
      query: {
        'lessonID': LId,
      },
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      quizModel = QuizModel.fromJson(value.data);
      print(quizModel!.data!.questions![0].questions);
      emit(QuizSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(QuizErrorState(error.toString()));
    });
  }

  int? correctAnswers = 0;
  int? wrongAnswers = 0;

  void checkAnswer(index) {
    if(index == 0) index = quizModel?.data?.questions?.length;
    if (selectedOption == quizModel!.data!.questions![index - 1].correctAns!) {
      correctAnswers = correctAnswers! + 1;
      print('Correct ans: ${correctAnswers} ');
      print('index: ${index}');
    } else {
      wrongAnswers = wrongAnswers! + 1;
      print('Wrong ans: ${wrongAnswers} ');
      print('index: ${index}');

    }
    if(correctAnswers == quizModel!.data!.numberOfQuestions){
     change_level(quizModel!.data!.questions![0].lessonID!);
     getQuiz(quizModel!.data!.questions![0].lessonID!);
     correctAnswers=0;
     wrongAnswers=0;
    }
    else if(correctAnswers != quizModel!.data!.numberOfQuestions && index == quizModel!.data!.questions?.length){
      getQuiz(quizModel!.data!.questions![0].lessonID!);
      correctAnswers=0;
      wrongAnswers=0;
    }
  }

  void change_level(LId){
    DioHelper.putData(url: changeLevel,
        token: CacheHelper.getData(key: 'token'),
        query: {
          'lessonID': LId,
        }
    ).then((value) {
      print(value.data);
      quizModel = QuizModel.fromJson(value.data);
      emit(QuizChangeLevelSuccessState());
    }).catchError((error) {
      print(error.toString());
    emit(QuizChangeLevelErrorState(error.toString()));
    });
  }
}