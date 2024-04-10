import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/models/lesson_model.dart';
import 'package:tarikhna/modules/arModule/ar_main_page.dart';
import 'package:tarikhna/modules/lessons/cubit/states.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/components/constants.dart';
import 'package:tarikhna/shared/network/local/cache_helper.dart';
import 'package:tarikhna/shared/network/remote/dio_helper.dart';

class LessonsCubit extends Cubit<LessonsState> {
  LessonsCubit() : super(LessonsInitialState());

  static LessonsCubit get(context) => BlocProvider.of(context);

  LessonModel? lesson;

  void getLessons() {
    emit(LessonsLoadingState());
    DioHelper.getData(
      url: LESSONS,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      lesson = LessonModel.fromJson(value.data);
      emit(LessonsSuccessState(lesson!));
    }).catchError((error) {
      emit(LessonsErrorState(error.toString()));
    });
  }

  // void getARScreen(context) {
  //   emit(OpenARWidgetState());
  //   //navigateTo(context, AR_Main());
  // }

  LessonModel? searchLesson;

  void search(value) {
    searchLesson = null;
    emit(LessonsSearchLoadingState());
    DioHelper.getData(
            url: SEARCH,
            query: {
              'wordToSearch': value,
            },
            token: CacheHelper.getData(key: 'token'))
        .then((value) {
      searchLesson = LessonModel.fromJson(value.data);
      print(searchLesson!.data!);
      emit(LessonsSearchSuccessState(searchLesson!));
    }).catchError((error) {
      emit(LessonsSearchErrorState(error.toString()));
    });
  }
}
