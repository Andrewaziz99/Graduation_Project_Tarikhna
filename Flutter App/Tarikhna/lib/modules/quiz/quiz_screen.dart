import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/lessons/lessons_screen.dart';
import 'package:tarikhna/modules/quiz/cubit/cubit.dart';
import 'package:tarikhna/modules/quiz/cubit/states.dart';
import 'package:tarikhna/shared/components/components.dart';

import '../const.dart';

class QuizScreen extends StatelessWidget {
  final String? id;

  QuizScreen(this.id, {super.key});

  var countDownController = CountDownController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => QuizCubit()..getQuiz(id!),
      child: BlocConsumer<QuizCubit, QuizStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = QuizCubit.get(context);
          return ConditionalBuilder(
              condition: cubit.quizModel != null,
              builder: (BuildContext context) {
                return Scaffold(
<<<<<<< HEAD
                  body: Container(
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
                                Text(
                                  "Quiz",
                                  style: TextStyle(
                                      color: titleTextColor,
                                      fontSize: 45,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Avenir'),
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
                                controller: countDownController,
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
                                      countDownController.restart(duration: 5);
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
                          height: 600,
                          child: Swiper(
                            onIndexChanged: (value) {
                              cubit.changeIndex(value);
                              cubit.checkAnswer(value, context);
                              cubit.selectedOption = null;
                            },
                            itemCount: cubit.quizModel!.data!.questions!.length,
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
                              return Stack(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 400,
                                        child: Card(
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32)),
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(34.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
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
                                                      fontSize: 50),
                                                  textAlign: TextAlign.left,
                                                ),
                                                const SizedBox(
                                                  height: 24,
                                                ),
                                                Column(
                                                  children: [
                                                    Row(children: [
                                                      Expanded(
                                                          child:
                                                              RadioMenuButton(
                                                        value: 0,
                                                        groupValue: cubit
                                                            .selectedOption,
                                                        style: ButtonStyle(
                                                          shape: MaterialStatePropertyAll(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10))),
                                                          elevation:
                                                              const MaterialStatePropertyAll(
                                                                  2),
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  meduim),
                                                        ),
                                                        onChanged: (val) {
                                                          cubit.selectedOption =
                                                              val;
                                                          cubit
                                                              .changeSelectedOption(
                                                                  val);
                                                        },
                                                        child: Text(cubit
                                                                .quizModel
                                                                ?.data
                                                                ?.questions?[
                                                                    index]
                                                                .choices?[0] ??
                                                            ''),
                                                      )),
                                                      const SizedBox(
                                                        width: 5.0,
                                                      ),
                                                      Expanded(
                                                          child:
                                                              RadioMenuButton(
                                                        value: 1,
                                                        groupValue: cubit
                                                            .selectedOption,
                                                        style: ButtonStyle(
                                                          shape: MaterialStatePropertyAll(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10))),
                                                          elevation:
                                                              const MaterialStatePropertyAll(
                                                                  2),
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  meduim),
                                                        ),
                                                        onChanged: (val) {
                                                          cubit.selectedOption =
                                                              val;
                                                          cubit
                                                              .changeSelectedOption(
                                                                  val);
                                                        },
                                                        child: Text(cubit
                                                                .quizModel
                                                                ?.data
                                                                ?.questions?[
                                                                    index]
                                                                .choices?[1] ??
                                                            ''),
                                                      ))
                                                    ]),
                                                    const SizedBox(
                                                      height: 24,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child:
                                                                RadioMenuButton(
                                                          value: 2,
                                                          groupValue: cubit
                                                              .selectedOption,
                                                          style: ButtonStyle(
                                                            shape: MaterialStatePropertyAll(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10))),
                                                            elevation:
                                                                const MaterialStatePropertyAll(
                                                                    2),
                                                            backgroundColor:
                                                                MaterialStatePropertyAll(
                                                                    meduim),
                                                          ),
                                                          onChanged: (val) {
                                                            cubit.selectedOption =
                                                                val;
                                                            cubit
                                                                .changeSelectedOption(
                                                                    val);
                                                          },
                                                          child: Text(cubit
                                                                  .quizModel
                                                                  ?.data
                                                                  ?.questions?[
                                                                      index]
                                                                  .choices?[2] ??
                                                              ''),
                                                        )),
                                                        const SizedBox(
                                                          width: 5.0,
                                                        ),
                                                        Expanded(
                                                            child:
                                                                RadioMenuButton(
                                                          value: 3,
                                                          groupValue: cubit
                                                              .selectedOption,
                                                          style: ButtonStyle(
                                                            shape: MaterialStatePropertyAll(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10))),
                                                            elevation:
                                                                const MaterialStatePropertyAll(
                                                                    2),
                                                            backgroundColor:
                                                                MaterialStatePropertyAll(
                                                                    meduim),
                                                          ),
                                                          onChanged: (val) {
                                                            cubit.selectedOption =
                                                                val;
                                                            cubit
                                                                .changeSelectedOption(
                                                                    val);
                                                          },
                                                          child: Text(cubit
                                                                  .quizModel
                                                                  ?.data
                                                                  ?.questions?[
                                                                      index]
                                                                  .choices?[3] ??
                                                              ''),
                                                        ))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
              fallback: (BuildContext context) {
                if (cubit.quizModel == null) {
                  return Scaffold(
                    body: Container(
=======
                  body: SingleChildScrollView(
                    child: Container(
>>>>>>> 0da7cdec29c180b5eaefda20708db5f212f08613
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [gradientStartColor, titleTextColor],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0.3, 0.98])),
<<<<<<< HEAD
=======
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
                                      Text(
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
                                          navigateAndFinish(context, LessonsScreen());
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
                            height: 600,
                            child: Swiper(
                              onIndexChanged: (value) {
                                cubit.changeIndex(value);
                                cubit.checkAnswer(value, context);
                                cubit.selectedOption = null;
                              },
                              itemCount: cubit.quizModel!.data!.questions!.length,
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
                                return Stack(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 400,
                                          child: Card(
                                            elevation: 8,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32)),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.all(34.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
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
                                                        fontSize: 50),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  const SizedBox(
                                                    height: 24,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Row(children: [
                                                        Expanded(
                                                            child:
                                                                RadioMenuButton(
                                                          value: 0,
                                                          groupValue: cubit
                                                              .selectedOption,
                                                          style: ButtonStyle(
                                                            shape: MaterialStatePropertyAll(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                10))),
                                                            elevation:
                                                                const MaterialStatePropertyAll(
                                                                    2),
                                                            backgroundColor:
                                                                MaterialStatePropertyAll(
                                                                    meduim),
                                                          ),
                                                          onChanged: (val) {
                                                            cubit.selectedOption =
                                                                val;
                                                            cubit
                                                                .changeSelectedOption(
                                                                    val);
                                                          },
                                                          child: Text(cubit
                                                                  .quizModel
                                                                  ?.data
                                                                  ?.questions?[
                                                                      index]
                                                                  .choices?[0] ??
                                                              ''),
                                                        )),
                                                        const SizedBox(
                                                          width: 5.0,
                                                        ),
                                                        Expanded(
                                                            child:
                                                                RadioMenuButton(
                                                          value: 1,
                                                          groupValue: cubit
                                                              .selectedOption,
                                                          style: ButtonStyle(
                                                            shape: MaterialStatePropertyAll(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                10))),
                                                            elevation:
                                                                const MaterialStatePropertyAll(
                                                                    2),
                                                            backgroundColor:
                                                                MaterialStatePropertyAll(
                                                                    meduim),
                                                          ),
                                                          onChanged: (val) {
                                                            cubit.selectedOption =
                                                                val;
                                                            cubit
                                                                .changeSelectedOption(
                                                                    val);
                                                          },
                                                          child: Text(cubit
                                                                  .quizModel
                                                                  ?.data
                                                                  ?.questions?[
                                                                      index]
                                                                  .choices?[1] ??
                                                              ''),
                                                        ))
                                                      ]),
                                                      const SizedBox(
                                                        height: 24,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child:
                                                                  RadioMenuButton(
                                                            value: 2,
                                                            groupValue: cubit
                                                                .selectedOption,
                                                            style: ButtonStyle(
                                                              shape: MaterialStatePropertyAll(
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10))),
                                                              elevation:
                                                                  const MaterialStatePropertyAll(
                                                                      2),
                                                              backgroundColor:
                                                                  MaterialStatePropertyAll(
                                                                      meduim),
                                                            ),
                                                            onChanged: (val) {
                                                              cubit.selectedOption =
                                                                  val;
                                                              cubit
                                                                  .changeSelectedOption(
                                                                      val);
                                                            },
                                                            child: Text(cubit
                                                                    .quizModel
                                                                    ?.data
                                                                    ?.questions?[
                                                                        index]
                                                                    .choices?[2] ??
                                                                ''),
                                                          )),
                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Expanded(
                                                              child:
                                                                  RadioMenuButton(
                                                            value: 3,
                                                            groupValue: cubit
                                                                .selectedOption,
                                                            style: ButtonStyle(
                                                              shape: MaterialStatePropertyAll(
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10))),
                                                              elevation:
                                                                  const MaterialStatePropertyAll(
                                                                      2),
                                                              backgroundColor:
                                                                  MaterialStatePropertyAll(
                                                                      meduim),
                                                            ),
                                                            onChanged: (val) {
                                                              cubit.selectedOption =
                                                                  val;
                                                              cubit
                                                                  .changeSelectedOption(
                                                                      val);
                                                            },
                                                            child: Text(cubit
                                                                    .quizModel
                                                                    ?.data
                                                                    ?.questions?[
                                                                        index]
                                                                    .choices?[3] ??
                                                                ''),
                                                          ))
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
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
                              stops: const [0.3, 0.98])),
>>>>>>> 0da7cdec29c180b5eaefda20708db5f212f08613
                      child: const Center(
                        child: Text("No Quiz Found"),
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
              });
        },
      ),
    );
  }
}
