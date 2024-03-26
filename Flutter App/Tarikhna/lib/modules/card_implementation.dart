import 'package:flutter/material.dart';
import 'exam_header.dart';
import 'package:card_swiper/card_swiper.dart';
import 'const.dart';
import 'main_card_statefull.dart';

class Card_implementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var questions = [
      'First',
      'Second',
      'Third',
      'Forth',
      'Fifth',
      '6th',
      '7th',
      '8th',
      '9th',
      '10th'
    ];

    List<String> answers = ['answer1', 'answer2', 'answer3', 'answer4'];
    return Scaffold(
      backgroundColor: gradientEndColor,
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
                itemCount: questions.length,
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
                          main_card_state(
                            question: '${index + 1} ) ${questions[index]}',
                            answers: answers,
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
  }
}
