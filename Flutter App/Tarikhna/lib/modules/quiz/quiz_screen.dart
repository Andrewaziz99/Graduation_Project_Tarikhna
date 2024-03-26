import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/exam_header.dart';
import 'package:tarikhna/modules/main_card_statefull.dart';
import 'package:tarikhna/modules/quiz/cubit/cubit.dart';
import 'package:tarikhna/modules/quiz/cubit/states.dart';

import '../../shared/styles/colors.dart';
import '../const.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = QuizCubit.get(context);
        return Stack(
          fit: StackFit.expand,
          children: [
            Image(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text('Quiz'),
                centerTitle: true,
              ),
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
                        itemCount: 10,
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
                                        padding: const EdgeInsets.all(34.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'question',
                                              style: TextStyle(
                                                  color: primaryTextColor,
                                                  fontWeight: FontWeight.w900,
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
                                                      child: RadioMenuButton(
                                                    value: 'Ans 1',
                                                    groupValue:
                                                        cubit.selectedOption,
                                                    style: ButtonStyle(
                                                      shape: MaterialStatePropertyAll(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
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
                                                          val!;
                                                    },
                                                    child: Text('Ans 1'),
                                                  )),
                                                  SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Expanded(
                                                      child: RadioMenuButton(
                                                    value: 'Ans 2',
                                                    groupValue:
                                                        cubit.selectedOption,
                                                    style: ButtonStyle(
                                                      shape: MaterialStatePropertyAll(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
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
                                                          val!;
                                                    },
                                                    child: Text('Ans 2'),
                                                  ))
                                                ]),
                                                const SizedBox(
                                                  height: 24,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: RadioMenuButton(
                                                      value: 'Ans 3',
                                                      groupValue:
                                                          cubit.selectedOption,
                                                      style: ButtonStyle(
                                                        shape: MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
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
                                                            val!;
                                                      },
                                                      child: Text('Ans 3'),
                                                    )),
                                                    SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    Expanded(
                                                        child: RadioMenuButton(
                                                      value: 'Ans 4',
                                                      groupValue:
                                                          cubit.selectedOption,
                                                      style: ButtonStyle(
                                                        shape: MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
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
                                                            val!;
                                                      },
                                                      child: Text('Ans 4'),
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
            ),
          ],
        );
      },
    );
  }
}
