import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'const.dart';

class main_card_state extends StatefulWidget {
  var question;
  var answers;

  main_card_state({Key? key, required this.question, required this.answers})
      : super(key: key);

  @override
  State<main_card_state> createState() => _main_card_stateState();
}

class _main_card_stateState extends State<main_card_state> {
  String choosenAnswer = 'none';

  @override
  Widget build(BuildContext context) {
    var givenAnswers = widget.answers;
    return SizedBox(
      height: 400,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.question,
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
                      value: givenAnswers[0],
                      groupValue: choosenAnswer,
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        elevation: MaterialStatePropertyAll(2),
                        backgroundColor: MaterialStatePropertyAll(meduim),
                      ),
                      onChanged: (val) {
                        setState(() {
                          choosenAnswer = val!;
                        });
                      },
                      child: Text(givenAnswers[0]),
                    )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                        child: RadioMenuButton(
                      value: givenAnswers[1],
                      groupValue: choosenAnswer,
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        elevation: MaterialStatePropertyAll(2),
                        backgroundColor: MaterialStatePropertyAll(meduim),
                      ),
                      onChanged: (val) {
                        setState(() {
                          choosenAnswer = val!;
                        });
                      },
                      child: Text(givenAnswers[1]),
                    ))
                  ]),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: RadioMenuButton(
                        value: givenAnswers[2],
                        groupValue: choosenAnswer,
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          elevation: MaterialStatePropertyAll(2),
                          backgroundColor: MaterialStatePropertyAll(meduim),
                        ),
                        onChanged: (val) {
                          setState(() {
                            choosenAnswer = val!;
                          });
                        },
                        child: Text(givenAnswers[2]),
                      )),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                          child: RadioMenuButton(
                        value: givenAnswers[3],
                        groupValue: choosenAnswer,
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          elevation: MaterialStatePropertyAll(2),
                          backgroundColor: MaterialStatePropertyAll(meduim),
                        ),
                        onChanged: (val) {
                          setState(() {
                            choosenAnswer = val!;
                          });
                        },
                        child: Text(givenAnswers[3]),
                      ))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
