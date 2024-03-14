import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/layout/home_layout.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/Saved_Item_Screen.dart';
import 'package:tarikhna/modules/ai/ai_input_screen.dart';
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/shared/bloc_observer.dart';
import 'package:tarikhna/shared/cubit/cubit.dart';
import 'package:tarikhna/shared/network/remote/dio_helper.dart';
import 'package:tarikhna/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  // await CacheHelper.init();
  //

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AICubit()..getAllSavedItem(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: AiInputScreen(),
      ),
    );
  }
}
