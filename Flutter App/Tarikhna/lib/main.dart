import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/layout/home_layout.dart';
import 'package:tarikhna/modules/Exam/cubit/exam_cubit.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/Saved_Item_Screen.dart';
import 'package:tarikhna/modules/ai/ai_input_screen.dart';
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/pdf_screen.dart';
import 'package:tarikhna/modules/arModule/ar_main_page.dart';
import 'package:tarikhna/modules/arModule/cubit/ar_cubit.dart';
import 'package:tarikhna/modules/arModule/model_viewer.dart';
import 'package:tarikhna/modules/home/cubit/home_page_cubit.dart';
import 'package:tarikhna/modules/home/homePage.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';
import 'package:tarikhna/modules/login/login_screen.dart';
import 'package:tarikhna/modules/navbar/cubit/navbar_cubit.dart';
import 'package:tarikhna/modules/navbar/navbar.dart';
import 'package:tarikhna/modules/navbar/notification.dart';
import 'package:tarikhna/modules/profile/cubit/cubit.dart';
import 'package:tarikhna/modules/register/register_screen.dart';
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
        BlocProvider(create: (context) => AICubit()..getAllSavedItem()),
        BlocProvider(create: (context) => ExamCubit()),
        BlocProvider(create: (context) => NavbarCubit()),
        BlocProvider(create: (context) => HomePageCubit()),
        BlocProvider(create: (context) => ArCubit()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: token ? NavBar_Page() : LoginScreen(),
        // home: Save_Item_Screen(),

      ),
    );
  }
}
