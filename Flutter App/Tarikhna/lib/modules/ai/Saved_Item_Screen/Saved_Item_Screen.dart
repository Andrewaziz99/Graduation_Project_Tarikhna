import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/models/AI_Save_Item_model.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/Ai_output_character_Screen.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/Navegate_Saved_Screen.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/cubit/savedState.dart';
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/cubit/states.dart';
import 'package:tarikhna/shared/styles/colors.dart';

class Save_Item_Screen extends StatelessWidget {
  const Save_Item_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SavedCubit()..getAllSavedItem(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: CustomPrimaryColor,
          title: Text(
            "Saved items",
            style: TextStyle(fontSize: 30),
          ),
        ),

        body: BlocProvider(
          create: (context) => SavedCubit()..getAllSavedItem(),
          child: BlocConsumer<SavedCubit, SavedState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = context.watch<SavedCubit>();
              var allSavedData = cubit.getSavedItemModel;
              print(allSavedData?.data?.length);

              return ConditionalBuilder(condition: allSavedData != null, builder: (context)=>ListView.separated(
                itemBuilder: (context, index) {
                  // Check if allSavedData is not null and has data
                  if (allSavedData != null && allSavedData.data != null) {
                    String? title = allSavedData.data?[index].title;
                    print(title);
                    print("title");
                    String? id = allSavedData.data![index].sId;

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

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Material(
                          elevation: 5, // Add elevation here
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                          child: ListTile(
                            title: Text(title ?? ""),
                            leading: Container(
                              width: 40, // Adjust to the desired size of the avatar
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black, // Border color
                                  width: 2.0, // Border width
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  "images/history.png",
                                  fit: BoxFit.contain,
                                  width: 24, // Adjust width to fit your needs
                                  height: 24, // Adjust height to fit your needs
                                ),
                              ),
                            ),
                            trailing: Image.asset("images/cloud.png"),
                          ),
                        ),
                      ),
                    );
                  } else {
                    // If allSavedData is null or has no data, show a placeholder widget
                    return Container(); // You can return any placeholder widget here
                  }
                },
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  // child: Divider(color: Colors.grey),
                ),
                itemCount: allSavedData?.data?.length ?? 0,
                padding: const EdgeInsets.only(top: 20.0),
              ), fallback: (context)=> Center(child: CircularProgressIndicator(),));
            },
          ),
        ),
      ),
    );
  }
}
