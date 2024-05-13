import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/models/Exam_Model.js.dart';
import 'package:tarikhna/modules/Exam/exam_leading_page.dart';
import 'package:tarikhna/modules/navbar/navbar.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/network/local/cache_helper.dart';
import 'package:tarikhna/shared/network/remote/dio_helper.dart';
import 'package:tarikhna/shared/components/constants.dart';

import 'exam_state.dart';

class ExamCubit extends Cubit<ExamStates> {
  ExamCubit() : super(ExamInitialState());

  static ExamCubit get(context) => BlocProvider.of(context);

  ExamModel? quizModel;

  int? correctAnswers = 0;
  int? wrongAnswers = 0;

  void getExamQuestions(List<String> lessonIds, int level) {
    print(CacheHelper.getData(key: 'token'));
    emit(ExamLoadingState()); // Emit loading state

    // Map each lesson ID to a string with double quotation marks
    List<String> formattedLessonIds = lessonIds.map((id) => '"$id"').toList();
    print(formattedLessonIds.toList().toString());

    // Join the formatted lesson IDs into a comma-separated string
    String lessonIdsString = formattedLessonIds.join(',');

    print(lessonIdsString);

    DioHelper.getData(
      url: EXAM,
      query: {
        'lessonID': formattedLessonIds.toList().toString(),
        // Use the comma-separated string
        'level': level,
        // Convert level to string
      },
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      quizModel = ExamModel.fromJson(value.data);
      // print(quizModel!.data!.questions![0].questions);
      print(quizModel?.data.length);

      emit(ExamSuccessState());
      print(quizModel?.message);
    }).catchError((error) {
      print(error.toString());
      emit(ExamErrorState(
          error.toString())); // Emit ExamErrorState, not QuizErrorState
    });
  }

  bool isselected = false;

  void toggleLessonSelection() {
    isselected = !isselected;
    print(isselected);
  }

  int? selectedOption;
  int? duration = 180;
  var countDownController = CountDownController();

  void changeSelectedOption(value) {
    selectedOption = value;
    emit(ExamChangeSelectedOptionState());
  }

  void changeIndex(index,context) {
    print(index);
    if(index ==0){
      index = 7;
    }

    emit(ExamChangeIndexState(index));

    if(index  == (quizModel?.data.length)!){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: 'Congratulations',

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('successfully passed the Exam', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            Text.rich(
              TextSpan(

                children: [

                  TextSpan(
                    text: 'Total Questions: ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '${quizModel?.data.length ?? 0}\n',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Correct Answers: ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '$correctAnswers\n',
                    style: TextStyle(color: Colors.green), // Green for correct answers
                  ),
                  TextSpan(
                    text: 'Wrong Answers: ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '$wrongAnswers\n',
                    style: TextStyle(color: Colors.red), // Red for wrong answers
                  ),

                ],
              ),
            ),
          ],
        ),
        btnOkText: 'OK',
        btnOkOnPress: () {
          navigateTo(context, ExamLeadingPage());
          correctAnswers = 0;
          wrongAnswers = 0;
        },
      ).show();
      // correctAnswers =0;
      // wrongAnswers =0;
    }
  }



  void changeDialogState() {
    emit(ExamChangeDialogState());
  }



  void checkAnswer(index, context) {
    if (index == 0) index = quizModel?.data?.length;
    if (selectedOption == quizModel!.data![index - 1].correctAns!) {
      correctAnswers = correctAnswers! + 1;
      print('Correct ans: $correctAnswers ');
    } else {
      wrongAnswers = wrongAnswers! + 1;
      print('Wrong ans: $wrongAnswers ');
    }
    if (correctAnswers == 5) {
      countDownController.pause();

      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: 'Congratulations',

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('successfully passed the Exam', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            Text.rich(
              TextSpan(

                children: [

                  TextSpan(
                    text: 'Total Questions: ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '${quizModel?.data.length ?? 0}\n',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Correct Answers: ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '$correctAnswers\n',
                    style: TextStyle(color: Colors.green), // Green for correct answers
                  ),
                  TextSpan(
                    text: 'Wrong Answers: ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '$wrongAnswers\n',
                    style: TextStyle(color: Colors.red), // Red for wrong answers
                  ),

                ],
              ),
            ),
          ],
        ),
        btnOkText: 'OK',
        btnOkOnPress: () {
          navigateTo(context,NavBar_Page() );
          correctAnswers = 0;
          wrongAnswers = 0;
        },
      ).show();
<<<<<<< HEAD
    } else if (wrongAnswers == 5 || wrongAnswers == quizModel?.data.length) {
=======

    } else if (wrongAnswers == 5 || wrongAnswers == quizModel?.data.length) {

>>>>>>> 50e36da92b6d1633d3ce83860fb6db4ab43b8c38
      countDownController.pause();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'Failed',
        // Use the body property for custom rich text
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('You have failed the Exam', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            Text.rich(
              TextSpan(

                children: [

                  TextSpan(
                    text: 'Total Questions: ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '${quizModel?.data.length ?? 0}\n',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Correct Answers: ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '$correctAnswers\n',
                    style: TextStyle(color: Colors.green), // Green for correct answers
                  ),
                  TextSpan(
                    text: 'Wrong Answers: ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '$wrongAnswers\n',
                    style: TextStyle(color: Colors.red), // Red for wrong answers
                  ),

                ],
              ),
            ),
          ],
        ),
        btnOkText: 'Try Again',
        btnOkOnPress: () {
          navigateTo(context, NavBar_Page());

          correctAnswers = 0;
          wrongAnswers = 0;
          countDownController.restart(duration: duration);
        },
      ).show();

    }
  }
<<<<<<< HEAD
}
=======

}



>>>>>>> 50e36da92b6d1633d3ce83860fb6db4ab43b8c38
