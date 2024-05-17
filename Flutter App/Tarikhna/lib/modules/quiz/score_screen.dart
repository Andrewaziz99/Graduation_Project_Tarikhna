import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/modules/lessons/lessons_screen.dart';
import 'package:tarikhna/modules/navbar/navbar.dart';
import 'package:tarikhna/modules/quiz/cubit/cubit.dart';
import 'package:tarikhna/modules/quiz/cubit/states.dart';
import 'package:tarikhna/modules/quiz/quiz_screen.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/styles/colors.dart';

class ScoreScreen extends StatelessWidget {
  final int? correctAnswers;
  final int? wrongAnswers;
  final String lessonID;

  ScoreScreen(
      {super.key, this.correctAnswers, this.wrongAnswers, required this.lessonID});

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
            Container(
              constraints: const BoxConstraints(
                maxWidth: 220,
              ),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
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
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 220,
              ),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
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
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            defaultButton(
              background: SecondaryColor,
              function: () {
                navigateAndFinish(context, NavBar_Page());
              },
              text: 'Home',
            ),
            const SizedBox(
              height: 20,
            ),
            defaultButton(
              background: HexColor('007900'),
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
