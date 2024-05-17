// Navigation_Screen.dart

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/modules/lessons/Lesson_output_character_screen.dart';

import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/styles/colors.dart';

import 'Lesson_output_date_screen.dart';



class Lesson_Navigate_Screen extends StatelessWidget {
  final String? id;

  const Lesson_Navigate_Screen(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Summarize',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: CustomPrimaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: CustomPrimaryColor,
              height: 500,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 300, // Adjust this value to position the buttons correctly
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'What do you want to summarize?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        navigateTo(context, Lesson_output_character_screen(id));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors4.navyblue,
                        //Color.fromARGB(255, 185, 212, 246),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //side: BorderSide(color: Colors.black),
                        ),
                      ),
                      icon: Image.asset("images/nefertiti_11263517.png"),
                      label: Text(
                        "Characters",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        navigateTo(context, Lesson_output_date_screen(id));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors4.navyblue,
                        //Color.fromARGB(255, 185, 212, 246),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //side: BorderSide(color: Colors.black),
                        ),
                      ),
                      icon: Image.asset("images/hourglass_2191902.png"),
                      label: Text(
                        "Date",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
