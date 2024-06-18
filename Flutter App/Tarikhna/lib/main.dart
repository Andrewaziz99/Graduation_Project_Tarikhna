import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/AR/cubit/cubit.dart';
import 'package:tarikhna/modules/Exam/cubit/exam_cubit.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/home/cubit/home_page_cubit.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';
import 'package:tarikhna/modules/navbar/cubit/navbar_cubit.dart';
import 'package:tarikhna/modules/profile/cubit/cubit.dart';
import 'package:tarikhna/modules/splash_screen/splash_screen.dart';
import 'package:tarikhna/shared/bloc_observer.dart';
import 'package:tarikhna/shared/network/local/cache_helper.dart';
import 'package:tarikhna/shared/network/remote/dio_helper.dart';
import 'package:tarikhna/shared/styles/themes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp({super.key});

  bool token = CacheHelper.getData(key: 'token') == null ? false : true;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileCubit()..getProfile()),
        BlocProvider(create: (context) => LessonsCubit()..getLessons()),
        BlocProvider(create: (context) => SavedCubit()..getAllSavedItem()),
        BlocProvider(create: (context) => ExamCubit()),
        BlocProvider(create: (context) => NavbarCubit()),
        BlocProvider(create: (context) => HomePageCubit()),
        BlocProvider(create: (context) => AICubit()),
        BlocProvider(create: (context) => ARCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: Splash_screen(),

         


      ),
    );
  }
}