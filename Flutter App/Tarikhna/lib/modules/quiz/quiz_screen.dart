import 'package:card_swiper/card_swiper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/exam_header.dart';
import 'package:tarikhna/modules/quiz/cubit/cubit.dart';
import 'package:tarikhna/modules/quiz/cubit/states.dart';

import '../const.dart';

class QuizScreen extends StatelessWidget {
  final String? id;

  QuizScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => QuizCubit()..getQuiz(id),
        child: BlocConsumer<QuizCubit, QuizStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            var cubit = QuizCubit.get(context);
            return ConditionalBuilder(
                condition: cubit.quizModel != null,
                builder: (BuildContext context) {
                  return Scaffold(
                    body: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [gradientStartColor, titleTextColor],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0.3, 0.98])),
                      child: SafeArea(
                          child: Column(
                        children: [
                          const HeaderWidget(),
                          SizedBox(
                            height: 600,
                            child: Swiper(
                              onIndexChanged: (value) {
                                // value = 0;
                                cubit.checkAnswer(value);
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
                                      activeColor: primaryTextColor)),
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
                                              padding:
                                                  const EdgeInsets.all(34.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${cubit.quizModel?.data?.questions?[index]?.questions ?? ''}',
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
                                                                        BorderRadius.circular(
                                                                            10))),
                                                            elevation:
                                                                MaterialStatePropertyAll(
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
                                                          child: Text(
                                                              '${cubit.quizModel?.data?.questions?[index]?.choices?[0] ?? ''}'),
                                                        )),
                                                        SizedBox(
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
                                                                        BorderRadius.circular(
                                                                            10))),
                                                            elevation:
                                                                MaterialStatePropertyAll(
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
                                                          child: Text(
                                                              '${cubit.quizModel?.data?.questions?[index]?.choices?[1] ?? ''}'),
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
                                                                  MaterialStatePropertyAll(
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
                                                            child: Text(
                                                                '${cubit.quizModel?.data?.questions?[index]?.choices?[2] ?? ''}'),
                                                          )),
                                                          SizedBox(
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
                                                                  MaterialStatePropertyAll(
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
                                                            child: Text(
                                                                '${cubit.quizModel?.data?.questions?[index]?.choices?[3] ?? ''}'),
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
                      )),
                    ),
                  );
                },
                fallback: (BuildContext context) => Center(
                      child: CircularProgressIndicator(),
                    ));
          },
        ));
  }
}
