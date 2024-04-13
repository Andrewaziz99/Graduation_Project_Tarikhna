import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/models/Quiz_model.dart';
import 'package:tarikhna/modules/quiz/cubit/states.dart';
import 'package:tarikhna/modules/quiz/score_screen.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/components/constants.dart';
import 'package:tarikhna/shared/network/local/cache_helper.dart';
import 'package:tarikhna/shared/network/remote/dio_helper.dart';

class QuizCubit extends Cubit<QuizStates> {
  QuizCubit() : super(QuizInitialState());

  static QuizCubit get(context) => BlocProvider.of(context);

  int? selectedOption;
  int? duration = 180;
  var countDownController = CountDownController();

  void changeSelectedOption(value) {
    selectedOption = value;
    emit(QuizChangeSelectedOptionState());
  }

  void changeIndex(index) {
    emit(QuizChangeIndexState(index));
  }

  void changeDialogState() {
    emit(QuizChangeDialogState());
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

  void checkAnswer(index, context) {
    if (index == 0) index = quizModel?.data?.questions?.length;
    if (selectedOption == quizModel!.data!.questions![index - 1].correctAns!) {
      correctAnswers = correctAnswers! + 1;
      print('Correct ans: $correctAnswers ');
    } else {
      wrongAnswers = wrongAnswers! + 1;
      print('Wrong ans: $wrongAnswers ');
    }
    if (correctAnswers == quizModel!.data!.numberOfQuestions) {
      countDownController.pause();
      change_level(quizModel!.data!.questions![0].lessonID!);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: 'Congratulations',
        desc: 'You have successfully passed the quiz',
        btnOkOnPress: () {
          navigateAndFinish(
              context,
              ScoreScreen(
                  correctAnswers: correctAnswers,
                  wrongAnswers: wrongAnswers,
                  lessonID: quizModel!.data!.questions![0].lessonID!));
          // getQuiz(quizModel!.data!.questions![0].lessonID!);
          // correctAnswers = 0;
          // wrongAnswers = 0;
        },
      ).show();
    } else if (wrongAnswers == quizModel!.data!.numberOfQuestions) {
      countDownController.pause();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'Failed',
        desc: 'You have failed the quiz',
        btnOkText: 'Try Again',
        btnOkOnPress: () {
          getQuiz(quizModel!.data!.questions![0].lessonID!);
          correctAnswers = 0;
          wrongAnswers = 0;
          countDownController.restart(duration: duration);
        },
      ).show();
    }
  }

  void change_level(LId) {
      emit(QuizChangeLevelState());
    DioHelper.putData(
        url: changeLevel,
        token: CacheHelper.getData(key: 'token'),
        query: {
          'lessonID': LId,
        }).then((value) {
      emit(QuizChangeLevelSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(QuizChangeLevelErrorState(error.toString()));
    });
  }
}
