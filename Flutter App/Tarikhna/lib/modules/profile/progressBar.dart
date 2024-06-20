import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tarikhna/modules/navbar/cubit/navbar_cubit.dart';
import 'package:tarikhna/modules/profile/change_password_screen.dart';
import 'package:tarikhna/modules/profile/cubit/cubit.dart';
import 'package:tarikhna/modules/profile/cubit/states.dart';
import 'package:tarikhna/modules/profile/profile_screen.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/components/constants.dart';
import 'package:tarikhna/shared/styles/colors.dart';

class Profile_Page_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = ProfileCubit.get(context);
        var profileModel = cubit.profileModel;
        return Scaffold(
          body: ConditionalBuilder(
            condition: profileModel != null,
            builder: (BuildContext context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Stack(children: [
                      Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1))
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              image: AssetImage("images/profile.png"),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ]),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Name: ${profileModel!.data!.name}',
                            style: const TextStyle(fontSize: 20)),
                        const SizedBox(height: 30),
                      ],
                    ),
                    // SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Email: ${profileModel.data!.email}',
                            style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    Container(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.all(15.0),
                          //   child: CircularPercentIndicator(
                          //     animation: true,
                          //     animationDuration: 500,
                          //     radius: 50,
                          //     lineWidth: 15,
                          //     percent: 0.5,
                          //     linearGradient: const LinearGradient(
                          //       colors: [Colors.green, Colors.blue],
                          //     ),
                          //     circularStrokeCap: CircularStrokeCap.round,
                          //     center: const Text(
                          //       "50%",
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 100),
                          defaultButton(
                            background: AppColors10.bluecielcolor,
                            function: () {
                              navigateTo(context, profile());
                            },
                            text: 'Edit Profile',
                          ),
                          const SizedBox(height: 20),
                          defaultButton(
                            background: Colors.blue,
                            function: () {
                              navigateTo(context, ChangePassScreen());
                            },
                            text: 'Change Password',
                          ),
                          const SizedBox(height: 20),
                          defaultButton(
                            background: Colors.red,
                            function: () {
                              signOut(context);
                            },
                            text: 'Sign out',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            fallback: (BuildContext context) => const Center(
              child: CircularProgressIndicator(),
            ),
            ),
        );
      },
    );
  }
}