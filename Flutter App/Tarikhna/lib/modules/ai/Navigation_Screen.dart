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
        final aiModel = AICubit.get(context).AiModel;

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
          body: ConditionalBuilder(
            condition: aiModel?.data != null,
            builder: (context) {
              if (aiModel!.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (aiModel.historicalORNot == false) {
                return Center(
                  child: Text(
                    "Please Enter The Historical data",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else {
                return Stack(
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
                      top: 200,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  navigateTo(context, AiOutputScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors4.navyblue,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 50,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                icon: Image.asset(
                                  "images/nefertiti_11263517.png",
                                ),
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
                                  navigateTo(context, Ai_output_dates_screen());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors4.navyblue,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 50,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                icon: Image.asset(
                                  "images/hourglass_2191902.png",
                                ),
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
                              if (aiModel.data != null) {
                                SavedCubit.get(context).SavedItems(
                                  data: aiModel.data!,
                                );
                                CherryToast.success(
                                  title: const Text('Success Save Item'),
                                  autoDismiss: true,
                                  toastPosition: Position.bottom,
                                  animationType: AnimationType.fromLeft,
                                  toastDuration: const Duration(seconds: 5),
                                  animationDuration:
                                  const Duration(milliseconds: 500),
                                ).show(context);
                              } else {
                                print("AiModel or its data is null");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent[400],
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 50,
                              ),
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
                );
              }
            },
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
