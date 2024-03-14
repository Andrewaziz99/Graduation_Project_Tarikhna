import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/models/Get_All_SavedItemmodel.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../models/AI_Save_Item_model.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class Saved_Date_Screen extends StatelessWidget {
  final String? id;

  Saved_Date_Screen(this.id);

  @override
  Widget build(BuildContext context) {
    // Use the id as needed in this page
    return BlocConsumer<AICubit, AIStates>(
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

        print(AICubit.get(context).AiModel?.data?.characters.length);
        var cubit = AICubit.get(context);
        var savedItemModel = cubit.getSavedItemModel;

        var data = savedItemModel?.data.firstWhere((element) => element.sId == id);
        print(savedItemModel?.data[0].sId);
        print(data?.dates);

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
                  if (data?.dates[0].date != null)
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
                    itemCount: data?.dates.length??0,
                    itemBuilder: (context, index) {
                      // CharactersModel? character = data?.characters[index];
                      DatesModel date = data!.dates.isNotEmpty && index < data!.dates.length
                          ? DatesModel.fromJson(data!.dates[index].toJson())
                          : DatesModel();

                      bool First = index == 0;
                      bool Last = index >= data!.dates.length - 1;
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
                            child: TextSummarizedBuilder( date, index, data.characters.length),
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
    );
  }
}


Widget TextSummarizedBuilder( DatesModel date, int index, int length) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: HexColor('D3C5C5'),
              ),
              child: ListTile(
                title: Text(date.event ?? '',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                leading: CircleAvatar(
                  child: Text(date.date?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
