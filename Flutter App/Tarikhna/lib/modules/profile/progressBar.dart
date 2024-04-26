import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/navbar/cubit/navbar_cubit.dart';
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
              builder: (BuildContext context) {
                return Padding(
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
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://media.istockphoto.com/id/1433346041/photo/cute-girl-iconic-character-with-glasses-isolated-white-background-3d-rendering.jpg?s=612x612&w=is&k=20&c=9jGKRehgcxvBrrLV-YwN5371DAa0XhFbumb5fr8EZwg='),
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
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CircularPercentIndicator(
                                animation: true,
                                animationDuration: 500,
                                radius: 50,
                                lineWidth: 15,
                                percent: 01,
                                linearGradient: const LinearGradient(
                                  colors: [Colors.green, Colors.blue],
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                center: const Text(
                                  "40%",
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            defaultButton(
                              background: PrimaryColor,
                              function: () {
                                navigateTo(context, profile());
                              },
                              text: 'Edit Profile',
                            ),
                            const SizedBox(height: 20),
                            defaultButton(
                              background: PrimaryColor,
                              function: () {},
                              text: 'Change Password',
                            ),
                            const SizedBox(height: 20),
                            defaultButton(
                              background: Colors.redAccent,
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
                );
              },
              fallback: (BuildContext context) => const Center(
                    child: CircularProgressIndicator(),
                  )),
        );
      },
    );
  }
}
