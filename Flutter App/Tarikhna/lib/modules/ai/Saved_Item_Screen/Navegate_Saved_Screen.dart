// Navigation_Screen.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/Ai_output_character_Screen.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/Ai_output_date_Screen.dart';
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/cubit/states.dart';
import 'package:tarikhna/modules/ai/ai_output_screen.dart';
import 'package:tarikhna/modules/ai/ai_output_dates_screen.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';



class Navigate_Saved_Screen extends StatelessWidget {
  final String? id;

  Navigate_Saved_Screen(this.id);

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
          Material(
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
          SizedBox(height: 100),
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
                      navigateTo(context, Saved_Caracter_Screen(id));
                    },
                    child: Text(
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
SizedBox(width: 30,),

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
                      navigateTo(context, Saved_Date_Screen(id));
                    },
                    child: Text(
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
