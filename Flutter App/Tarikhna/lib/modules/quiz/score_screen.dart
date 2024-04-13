import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/lessons/lessons_screen.dart';
import 'package:tarikhna/modules/quiz/cubit/cubit.dart';
import 'package:tarikhna/modules/quiz/cubit/states.dart';
import 'package:tarikhna/modules/quiz/quiz_screen.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/styles/colors.dart';

class ScoreScreen extends StatelessWidget {
  final int? correctAnswers;
  final int? wrongAnswers;
  final String? lessonID;

  ScoreScreen(
      {super.key, this.correctAnswers, this.wrongAnswers, this.lessonID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Score'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Text('Correct Answers: ${correctAnswers}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                Text('Wrong Answers: ${wrongAnswers}'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            defaultButton(
              background: PrimaryColor,
              function: () {
                navigateAndFinish(context, LessonsScreen());
              },
              text: 'Home',
            ),
            const SizedBox(
              height: 20,
            ),
            defaultButton(
              background: PrimaryColor,
              function: () {
                navigateTo(context, QuizScreen(lessonID));
              },
              text: 'Go to next level',
            ),
          ],
        ),
      ),
    );
  }
}
