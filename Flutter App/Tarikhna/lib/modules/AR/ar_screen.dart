import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/AR/cubit/cubit.dart';
import 'package:tarikhna/modules/AR/cubit/states.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';

class ARScreen extends StatelessWidget {
  final String? id;

  const ARScreen(this.id, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ARCubit, ARState>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var lessoncubit = LessonsCubit.get(context);
        var lesson = lessoncubit.lesson;

        var lessondata = lesson?.data?.firstWhere((element) => element.sId == id);

        return Scaffold(
            appBar: AppBar(
              title: const Text('AR Screen'),
            ),
            body:  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(lessondata!.AR_Text ?? 'Loading...'),
                ],
              ),
            )
        );
      },
    );
  }
}
