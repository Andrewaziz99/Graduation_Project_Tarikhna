import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/Exam/cubit/exam_cubit.dart';
import 'package:tarikhna/modules/Exam/cubit/exam_state.dart';
import 'package:tarikhna/modules/exam_header.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:tarikhna/modules/lessons/lessons_screen.dart';
import 'package:tarikhna/modules/navbar/navbar.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'const.dart';
import 'main_card_statefull.dart';

class MainExamScreen extends StatelessWidget {
  final List<String> lessonIds;
  final int level;

  MainExamScreen({required this.lessonIds, required this.level});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ExamCubit()..getExamQuestions(lessonIds, level),
      child: BlocConsumer<ExamCubit, ExamStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = ExamCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.quizModel != null,
            builder: (BuildContext context) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [gradientStartColor, titleTextColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.3, 0.98],
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Exam",
                                    style: TextStyle(
                                      color: titleTextColor,
                                      fontSize: 45,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Avenir',
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      navigateAndFinish(context, NavBar_Page());
                                    },
                                    icon: const Icon(Icons.home),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: CircularCountDownTimer(
                                controller: cubit.countDownController,
                                width: 50.0,
                                height: 50.0,
                                duration: 180,
                                fillColor: Colors.white,
                                ringColor: primaryTextColor,
                                isReverse: true,
                                fillGradient: const LinearGradient(
                                  colors: [Colors.red, Colors.green],
                                ),
                                onComplete: () {
                                  cubit.changeDialogState();
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.warning,
                                    animType: AnimType.scale,
                                    title: 'Time Out',
                                    desc: 'You have run out of time',
                                    btnCancelOnPress: () {
                                      Navigator.pop(context);
                                    },
                                    btnOkText: 'Restart',
                                    btnOkOnPress: () {
                                      cubit.quizModel = null;
                                      cubit.wrongAnswers = 0;
                                      cubit.correctAnswers = 0;
                                      cubit.getExamQuestions(lessonIds, level);
                                    },
                                  ).show();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${cubit.correctAnswers} / ${cubit.quizModel!.data!.length}',
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Swiper(
                            containerHeight: MediaQuery.of(context).size.height,
                            containerWidth: MediaQuery.of(context).size.width,
                            onIndexChanged: (value) {


                              cubit.checkAnswer(cubit.selectedOption, context);
                              cubit.changeIndex(value,context);
                              cubit.selectedOption = null;

                              print("value");
                              print(value);
                              // Implement your quiz logic here
                              // Example: cubit.checkAnswer(value, context);

                            },
                            itemCount: cubit.quizModel!.data!.length,
                            loop: true,
                            itemWidth: MediaQuery.of(context).size.width,
                            itemHeight: MediaQuery.of(context).size.height,
                            layout: SwiperLayout.TINDER,
                            pagination: SwiperPagination(
                              builder: FractionPaginationBuilder(
                                color: primaryTextColor,
                                activeColor: primaryTextColor,
                              ),
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.7,
                                    child: Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(34.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              cubit.quizModel!.data![index].questions,
                                              style: TextStyle(
                                                color: primaryTextColor,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Avenir',
                                                fontSize: 25,

                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                            const SizedBox(
                                              height: 120,
                                            ),

                                            Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors
                                                        .lightBlueAccent
                                                        .withOpacity(0.6),
                                                    borderRadius:
                                                    BorderRadius.circular(25),
                                                  ),
                                                  child: RadioListTile(
                                                    value: 0,
                                                    title: Text(
                                                      cubit.quizModel?.data[index].choices[0] ?? '',
                                                      style: TextStyle(
                                                        color:
                                                        primaryTextColor,
                                                        fontWeight:
                                                        FontWeight
                                                            .w900,
                                                        fontFamily:
                                                        'Avenir',
                                                      ),
                                                      textAlign:
                                                      TextAlign.right,
                                                    ),
                                                    groupValue: cubit
                                                        .selectedOption,
                                                    onChanged: (val) {
                                                      cubit.selectedOption =
                                                          val;
                                                      cubit
                                                          .changeSelectedOption(
                                                          val);
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors
                                                        .lightBlueAccent
                                                        .withOpacity(0.6),
                                                    borderRadius:
                                                    BorderRadius.circular(25),
                                                  ),
                                                  child: RadioListTile(
                                                    value: 1,
                                                    title: Text(
                                                      cubit.quizModel?.data[index].choices[1] ?? '',
                                                      style: TextStyle(
                                                        color:
                                                        primaryTextColor,
                                                        fontWeight:
                                                        FontWeight
                                                            .w900,
                                                        fontFamily:
                                                        'Avenir',
                                                      ),
                                                      textAlign:
                                                      TextAlign.right,
                                                    ),
                                                    groupValue: cubit
                                                        .selectedOption,
                                                    onChanged: (val) {
                                                      cubit.selectedOption =
                                                          val;
                                                      cubit
                                                          .changeSelectedOption(
                                                          val);
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors
                                                        .lightBlueAccent
                                                        .withOpacity(0.6),
                                                    borderRadius:
                                                    BorderRadius.circular(25),
                                                  ),
                                                  child: RadioListTile(
                                                    value: 2,
                                                    title: Text(
                                                      cubit.quizModel?.data[index].choices[2] ?? '',
                                                      style: TextStyle(
                                                        color:
                                                        primaryTextColor,
                                                        fontWeight:
                                                        FontWeight
                                                            .w900,
                                                        fontFamily:
                                                        'Avenir',
                                                      ),
                                                      textAlign:
                                                      TextAlign.right,
                                                    ),
                                                    groupValue: cubit
                                                        .selectedOption,
                                                    onChanged: (val) {
                                                      cubit.selectedOption =
                                                          val;
                                                      cubit
                                                          .changeSelectedOption(
                                                          val);
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors
                                                        .lightBlueAccent
                                                        .withOpacity(0.6),
                                                    borderRadius:
                                                    BorderRadius.circular(25),
                                                  ),
                                                  child: RadioListTile(
                                                    value: 3,
                                                    title: Text(
                                                      cubit.quizModel?.data[index].choices[3] ?? '',
                                                      style: TextStyle(
                                                        color:
                                                        primaryTextColor,
                                                        fontWeight:
                                                        FontWeight
                                                            .w900,
                                                        fontFamily:
                                                        'Avenir',
                                                      ),
                                                      textAlign:
                                                      TextAlign.right,
                                                    ),
                                                    groupValue: cubit
                                                        .selectedOption,
                                                    onChanged: (val) {
                                                      cubit.selectedOption =
                                                          val;
                                                      cubit
                                                          .changeSelectedOption(
                                                          val);
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            fallback: (BuildContext context) {
              if (cubit.quizModel == null) {
                return Scaffold(
                  body: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [gradientStartColor, titleTextColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.3, 0.98],
                      ),
                    ),
                    child: const Center(
                      child: Text("No Exam Found"),
                    ),
                  ),
                );
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}