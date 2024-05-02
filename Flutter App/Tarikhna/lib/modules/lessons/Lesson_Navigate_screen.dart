// Navigation_Screen.dart

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/modules/lessons/Lesson_output_character_screen.dart';

import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/styles/colors.dart';

import 'Lesson_output_date_screen.dart';



class Lesson_Navigate_Screen extends StatelessWidget {
  final String? id;

  const Lesson_Navigate_Screen(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("FFF9F9"),
      appBar: AppBar(
        backgroundColor: HexColor("FFF9F9"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Material(
            elevation: 10,
            shadowColor: Colors.white,
            borderOnForeground: true,
            child: Text(
              'Select Summarize',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 15,
                shadowColor: Colors.white,
                borderOnForeground: true,
                child: Container(
                  width: 150,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:  CustomPrimaryColor,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      navigateTo(context, Lesson_output_character_screen(id));
                    },
                    child: const Text(
                      "Characters",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30,),

              Material(
                elevation: 15,
                shadowColor: Colors.white,
                borderOnForeground: true,
                child: Container(
                  width: 150,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomPrimaryColor,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      navigateTo(context, Lesson_output_date_screen(id));
                    },
                    child: const Text(
                      "Date",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
