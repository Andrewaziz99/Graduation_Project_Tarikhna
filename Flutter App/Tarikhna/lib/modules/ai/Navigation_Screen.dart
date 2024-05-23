// Navigation_Screen.dart


import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:tarikhna/modules/ai/Saved_Item_Screen/cubit/cubit.dart';

import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/cubit/states.dart';
import 'package:tarikhna/modules/ai/ai_output_screen.dart';
import 'package:tarikhna/modules/ai/ai_output_dates_screen.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:tarikhna/shared/styles/colors.dart';

import 'Saved_Item_Screen/Saved_Item_Screen.dart';

class Navigate_Screen extends StatelessWidget {
  const Navigate_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AICubit, AIStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
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
                  height: 600,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 200, // Adjust this value to position the buttons correctly
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // const Text(
                    //   'What do you want to summarize?',
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //     fontFamily: 'Roboto',
                    //   ),
                    // ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors4.navyblue,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Image.asset("images/nefertiti_11263517.png"),
                          // icon: const Icon(Icons.person, color: Colors.blue),
                          label: const Text(
                            "Characters",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors4.navyblue,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Image.asset("images/hourglass_2191902.png"),
                          // icon: const Icon(Icons.calendar_today, color: Colors.blue),
                          label: const Text(
                            "Dates",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Placeholder action for Save Data button
                        print("Save Data button pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent[400],
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.save, color: Colors.white),
                      label: const Text(
                        "Save Data",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {

      },
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
