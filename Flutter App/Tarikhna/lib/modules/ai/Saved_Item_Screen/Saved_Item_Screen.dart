import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/models/AI_Save_Item_model.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/Ai_output_character_Screen.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/Navegate_Saved_Screen.dart';
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/cubit/states.dart';

class Save_Item_Screen extends StatelessWidget {
  const Save_Item_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("FFF9F9"),
      appBar: AppBar(
        backgroundColor: HexColor("EDDCDC"),
        title: Text(
          "Saves item",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: BlocConsumer<AICubit, AIStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AICubit.get(context);
          var allSavedData = cubit.getSavedItemModel;

          return ListView.separated(
            itemBuilder: (context, index) {
              String? title = allSavedData?.data[index].title;
              String? id = allSavedData?.data[index].sId;

              return GestureDetector(
                onTap: () {
                  // Navigate to the Saved_Caracter_Screen and pass the ID
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Navigate_Saved_Screen(id),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(title ?? ""),
                  leading: CircleAvatar(
                    backgroundColor: HexColor("EDDCDC"),
                    child: Icon(Icons.history_edu_outlined),
                  ),
                  trailing: Icon(Icons.save_alt_outlined),
                ),
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 30),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
            ),
            itemCount: allSavedData?.data.length ?? 0,
          );
        },
      ),
    );
  }
}
