import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/models/Get_All_SavedItemmodel.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/cubit/savedState.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../models/AI_Save_Item_model.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class Saved_Caracter_Screen extends StatelessWidget {
  final String? id;

  Saved_Caracter_Screen(this.id);

  @override
  Widget build(BuildContext context) {
    // Use the id as needed in this page
    return BlocProvider(create:(context)=>SavedCubit()..getAllSavedItem() ,child: BlocConsumer<SavedCubit, SavedState>(
      listener: (BuildContext context, state) {
        // if (state is SavedModelLoadingState) {
        //   // Handle loading state
        // }
        //
        // if (state is SavedModelSuccessState) {
        //   print('Success');
        // }
      },
      builder: (BuildContext context, Object? state) {
        print("Listener");

        print(SavedCubit.get(context).getSavedItemModel?.data?[0].characters);
        var cubit = SavedCubit.get(context);
        var savedItemModel = cubit.getSavedItemModel;

        var data = savedItemModel?.data?.firstWhere((element) => element.sId == id);

        if (data != null) {
          print(savedItemModel?.data?[0].sId);
          print(data.dates?.map((date) => date.date)); // Accessing date.date after null check
          print(data.characters?.length); // Check if characters list is null
        } else {
          print('Data is null or empty');
        }


        if (savedItemModel == null || savedItemModel.data == null) {
          // Handle the case where savedItemModel or its data is null
          print('Data is null or empty');
          return Scaffold(

            // Return an empty Scaffold or any other widget to indicate the absence of data
          );
        }




        return Scaffold(
          backgroundColor: HexColor("FFF9F9"),
          appBar: AppBar(
            backgroundColor: HexColor("FFF9F9"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  if (data!.characters?[0].nameOfCharacter != null)
                    Container(
                      width: 300,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                        child: Text(
                          "TEXT OUTPUT",
                          style: TextStyle(
                            fontFamily: 'JacquesFrancois',
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: data?.characters?.length??1,
                    itemBuilder: (context, index) {
                      SavedCharacters? character = data?.characters?[index];
                      GetAllDataSaved date = data!.dates!.isNotEmpty && index < data!.dates!.length
                          ? GetAllDataSaved.fromJson(data!.dates![index].toJson())
                          : GetAllDataSaved();

                      bool First = index == 0;
                      bool Last = index == data!.characters!.length - 1;
                      return Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 400,
                              child: TimelineTile(
                                isFirst: First,
                                isLast: Last,
                                beforeLineStyle: LineStyle(color: HexColor('D3C5C5')),
                                indicatorStyle: IndicatorStyle(
                                  width: 40,
                                  color: HexColor('D3C5C5'),
                                  iconStyle: IconStyle(
                                    iconData: Icons.arrow_downward_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: TextSummarizedBuilder(character, index, data.characters!.length),
                            flex: 16,
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 1.0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),);
  }
}

Widget TextSummarizedBuilder(SavedCharacters? character, int index, int length) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        Column(
          children: [
            if (character?.nameOfCharacter != null)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: HexColor('D3C5C5'),
                ),
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (character?.events != null && character!.events!.isNotEmpty)
                            for (String event in character?.events ?? [])
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [


                                      Expanded(
                                        child: Text(
                                          event,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(width: 10),
                                      SizedBox(
                                        width: 10,
                                        // Adjust the space between the bullet and the text
                                        child: Text('•', style: TextStyle(fontSize: 40)), // Bullet
                                      ),
                                    ],
                                  ),
                                  // SizedBox(height: 5), // Add space between events
                                  if(character.events!.length >1)
                                  Container(width: double.infinity,height:
                                    1,color: Colors.white,)
                                ],
                              ),
                        ],
                      ),
                    ],
                  ),

                  leading: Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text(
                      character?.nameOfCharacter ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,fontSize: 10
                        // Adjust the fontSize as needed
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
