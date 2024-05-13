import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/models/AI_Save_Item_model.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/Ai_output_character_Screen.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/Navegate_Saved_Screen.dart';
<<<<<<< HEAD
=======
import 'package:tarikhna/modules/ai/Saved_Item_Screen/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/cubit/savedState.dart';
>>>>>>> 50e36da92b6d1633d3ce83860fb6db4ab43b8c38
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/cubit/states.dart';

class Save_Item_Screen extends StatelessWidget {
  const Save_Item_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
          print(allSavedData?.data?.length);

          return ListView.separated(
            itemBuilder: (context, index) {
              // Check if allSavedData is not null and has data
              // if (allSavedData != null && allSavedData.data != null) {
                String? title = allSavedData?.data?[index].title;
                print(title);
                print("title");
                String? id = allSavedData?.data![index].sId;


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
              // } else {
              //
              //   // If allSavedData is null or has no data, show a placeholder widget
              //   return Container(); // You can return any placeholder widget here
              // }
            },
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 30),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
            ),
            itemCount: allSavedData?.data?.length ?? 0,
          );
        },
=======
    return BlocProvider(
      create: (context) => SavedCubit()..getAllSavedItem(),
      child: Scaffold(
        backgroundColor: HexColor("FFF9F9"),
        appBar: AppBar(
          backgroundColor: HexColor("EDDCDC"),
          title: Text(
            "Saves item",
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: BlocProvider(create:(context)=>SavedCubit()..getAllSavedItem() ,child: BlocConsumer<SavedCubit, SavedState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.watch<SavedCubit>();
            var allSavedData = cubit.getSavedItemModel;
            print(allSavedData?.data?.length);

            return ListView.separated(
              itemBuilder: (context, index) {
                // Check if allSavedData is not null and has data
                if (allSavedData != null && allSavedData.data != null) {
                  String? title = allSavedData?.data?[index].title;
                  print(title);
                  print("title");
                  String? id = allSavedData?.data![index].sId;

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
                } else {
                  // If allSavedData is null or has no data, show a placeholder widget
                  return Container(); // You can return any placeholder widget here
                }
              },
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 30),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              itemCount: allSavedData?.data?.length ?? 0,
            );
          },
        ),),
>>>>>>> 50e36da92b6d1633d3ce83860fb6db4ab43b8c38
      ),
    );
  }
}
