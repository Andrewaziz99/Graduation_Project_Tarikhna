import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/home/homePage.dart';
import 'package:tarikhna/modules/lessons/lessons_screen.dart';
import 'package:tarikhna/modules/navbar/navbar.dart';
import 'package:tarikhna/modules/quiz/cubit/cubit.dart';
import 'package:tarikhna/modules/quiz/cubit/states.dart';
import 'package:tarikhna/shared/components/components.dart';

import '../const.dart';

class QuizScreen extends StatelessWidget {
  final String id;

  QuizScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => QuizCubit()..getQuiz(id),
      child: BlocConsumer<QuizCubit, QuizStates>(
        listener: (BuildContext context, state) {
          if (state is QuizErrorState ||
              QuizCubit.get(context).quizModel == null) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.scale,
              title: 'NO QUIZ YET',
              desc: 'There is no quiz for this lesson',
              btnCancelOnPress: () {
                Navigator.pop(context);
              },
              btnOkText: 'Retry',
              btnOkOnPress: () {
                QuizCubit.get(context).getQuiz(id);
              },
            ).show();
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = QuizCubit.get(context);
          return Scaffold(
            body: ConditionalBuilder(
                condition: cubit.quizModel?.data != null,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [gradientStartColor, titleTextColor],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0.3, 0.98])),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Quiz",
                                        style: TextStyle(
                                            color: titleTextColor,
                                            fontSize: 45,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Avenir'),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          navigateAndFinish(
                                              context, const NavBar_Page());
                                        },
                                        icon: const Icon(Icons.home),
                                      ),
                                    ],
                                  ),
                                ]),
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
                                      // dismissOnTouchOutside: false,
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
                                        cubit.getQuiz(id);
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
                                  '${cubit.correctAnswers} / ${cubit.quizModel!.data!.questions!.length}',
                                  style: TextStyle(
                                      color: primaryTextColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Avenir'),
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
                                cubit.changeIndex(value);
                                cubit.checkAnswer(value, context);
                                cubit.selectedOption = null;
                              },
                              itemCount:
                                  cubit.quizModel!.data!.questions!.length,
                              loop: true,
                              itemWidth: MediaQuery.of(context).size.width,
                              itemHeight: MediaQuery.of(context).size.height,
                              layout: SwiperLayout.TINDER,
                              pagination: SwiperPagination(
                                  builder: FractionPaginationBuilder(
                                color: primaryTextColor,
                                activeColor: primaryTextColor,
                              )),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Expanded(
                                      child: Card(
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32)),
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                maxLines: 3,
                                                cubit
                                                        .quizModel
                                                        ?.data
                                                        ?.questions?[index]
                                                        .questions ??
                                                    '',
                                                style: TextStyle(
                                                    color: primaryTextColor,
                                                    fontWeight:
                                                        FontWeight.w900,
                                                    fontFamily: 'Avenir',
                                                    fontSize: 25),
                                                textAlign: TextAlign.right,
                                              ),
                                              const SizedBox(
                                                height: 120,
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
                                                  value: 0,
                                                  title: Text(
                                                    cubit
                                                        .quizModel
                                                        ?.data
                                                        ?.questions?[
                                                    index]
                                                        .choices?[0] ??
                                                        '',
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
                                                    cubit
                                                        .quizModel
                                                        ?.data
                                                        ?.questions?[
                                                    index]
                                                        .choices?[1] ??
                                                        '',
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
                                                    cubit
                                                        .quizModel
                                                        ?.data
                                                        ?.questions?[
                                                    index]
                                                        .choices?[2] ??
                                                        '',
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
                                                    cubit
                                                        .quizModel
                                                        ?.data
                                                        ?.questions?[
                                                    index]
                                                        .choices?[3] ??
                                                        '',
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
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                fallback: (BuildContext context) => const Center(
                      child: CircularProgressIndicator(),
                    )),
          );
        },
      ),
    );
  }
}
