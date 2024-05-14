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

import 'Saved_Item_Screen/Saved_Item_Screen.dart';

class Navigate_Screen extends StatelessWidget {
  const Navigate_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AICubit, AIStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: HexColor("FFF9F9"),
          appBar: AppBar(
            backgroundColor: HexColor("FFF9F9"),
          ),
          body: ConditionalBuilder(
            builder: (context) => Column(
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
                      fontFamily: 'JacquesFrancois',
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
                          color: HexColor('5E8BFF'),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            navigateTo(context, AiOutputScreen());
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
                    const SizedBox(width: 40),
                    Material(
                      elevation: 15,
                      shadowColor: Colors.white,
                      borderOnForeground: true,
                      child: Container(
                        width: 150,
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HexColor('5E8BFF'),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            navigateTo(context, const Ai_output_dates_screen());
                          },
                          child: const Text(
                            "Dates",
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
                const SizedBox(height: 30),
                Material(
                  elevation: 15,
                  shadowColor: Colors.white,
                  borderOnForeground: true,
                  child: Container(
                    width: 150,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('5E8BFF'),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        // Check if AiModel and its data are not null before accessing
                        final aiModel = AICubit.get(context).AiModel;
                        if (aiModel != null && aiModel.data != null) {
                          // Pass the data to SavedItems if available
                          SavedCubit.get(context).SavedItems(
                            // dataModel: aiModel.data!,
                            data: aiModel.data!, // Corrected parameter
                          );
                          CherryToast.success(
                            title: const Text('Success Save Item'),
                            autoDismiss: true,
                            toastPosition: Position.bottom,
                            animationType: AnimationType.fromLeft,
                            toastDuration: const Duration(seconds: 5),
                            animationDuration: const Duration(milliseconds: 500),
                          ).show(context);
                        } else {
                          // Handle null data case, perhaps show a message or perform some action
                          print("AiModel or its data is null");
                        }
                      },
                      child: const Text(
                        "Save Data",
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
            condition: state is TextSummarizedSuccessState,
            fallback: (context) => const Center(child: CircularProgressIndicator()),
          ),
        );
      },
      listener: (context, state) {

      },
    );
  }
}