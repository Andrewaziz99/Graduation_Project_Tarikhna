import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/models/Get_All_SavedItemmodel.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/cubit/savedState.dart';
import 'package:timeline_tile/timeline_tile.dart';


class Saved_Date_Screen extends StatelessWidget {
  final String? id;

  Saved_Date_Screen(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>SavedCubit()..getAllSavedItem() ,
      child: BlocConsumer<SavedCubit, SavedState>(
        listener: (BuildContext context, state) {
          // Handle listener events if needed
        },
        builder: (BuildContext context, Object? state) {
          print("Listener");

          var cubit = SavedCubit.get(context);
          var savedItemModel = cubit.getSavedItemModel;

          if (savedItemModel == null || savedItemModel.data == null) {
            // Handle the case where savedItemModel or its data is null
            print('Data is null or empty');
            return Scaffold(

              // Return an empty Scaffold or any other widget to indicate the absence of data
            );
          }if (savedItemModel == null || savedItemModel.data == null) {
            // Handle the case where savedItemModel or its data is null
            print('Data is null or empty');
            return Scaffold(

              // Return an empty Scaffold or any other widget to indicate the absence of data
            );
          }

          var data = savedItemModel.data!.firstWhere((element) => element.sId == id, orElse: () => GetAllDataSaved());

          print(savedItemModel.data?[0].sId);
          print(data.dates?.map((date) => date.date));
          print(data.characters?.length);

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
                    if (data.dates != null && data.dates!.isNotEmpty) // Check if dates are not null and not empty
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
                      itemCount: data.dates?.length ?? 0,
                      itemBuilder: (context, index) {
                        GetAllDataSaved date = data; // Use the correct data

                        bool First = index == 0;
                        bool Last = index >= data.dates!.length - 1;
                        return Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 250,
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
                              child: TextSummarizedBuilder(date,index,data.dates!.length), // Pass the correct data
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


Widget TextSummarizedBuilder(GetAllDataSaved date, int index, int length) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(

      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: HexColor('D3C5C5'),
          ),
          child: ListTile(
            leading: Container(
                alignment: Alignment.center,
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(child: Text(
                  date.dates?[index].date ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    // Adjust the fontSize as needed
                  ),
                ),)
            ),
            title: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (String event in date.dates?[index].event ?? [])
                      Row(
                        children: [
                          // Adjust the space between the bullet and the text
                          Expanded(
                            child: Text(
                              event,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // SizedBox(width: 20),
                          SizedBox(
                            width: 10,
                            // Adjust the space between the bullet and the text
                            child: Text('•',
                                style: TextStyle(fontSize: 40)), // Bullet
                          ),
                        ],
                      ),
                    if(date.dates![index].event!.length > 1 )
                      Container(width: double.infinity,height:
                      1,color: Colors.white,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}