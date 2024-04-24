import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/models/Get_All_SavedItemmodel.dart';
import 'package:tarikhna/models/lesson_model.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../models/AI_Save_Item_model.dart';
import 'cubit/states.dart';

class Lesson_output_date_screen extends StatelessWidget {
  final String? id;

  Lesson_output_date_screen(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonsCubit, LessonsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = LessonsCubit.get(context);
        var lessonmodel = cubit.lesson;

        var data = lessonmodel?.data?.firstWhere((element) => element.sId == id);

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
                  if (data != null && data.Dates != null && data.Dates!.isNotEmpty)
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
                  if (data != null && data.Dates != null && data.Dates!.isNotEmpty)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: data?.Dates?.length ?? 0, // Use the length of data.Dates
                      itemBuilder: (context, index) {
                        // if (data?.Dates == null || index >= data!.Dates!.length) {
                        //   return SizedBox.shrink();
                        // }

                        DateModel dateModel = DateModel.fromJson(data!.Dates![index].toJson()); // Convert DatesModel to DateModel
                        bool isFirst = index == 0;
                        bool isLast = index >= (data!.Dates!.length - 1); // Check if it's the last item
                        return Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 250,
                                child: TimelineTile(
                                  isFirst: isFirst,
                                  isLast: isLast,
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
                              child: TextSummarizedBuilder(dateModel, index, data!.Dates!.length),
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

Widget TextSummarizedBuilder(DateModel date, int index, int length) {
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
                title: Text(
                  date.event ?? '',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                leading: Container(
                  alignment: Alignment.center,
                  width: 70, // Adjust width according to your requirement
                  height: 70, // Adjust height according to your requirement
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    color: Colors.white, // Change color here
                  ),
                  child: Center(child: Text(
                    date.date ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black, // Change text color here
                        fontWeight: FontWeight.w900,fontSize: 10
                    ),
                  ),),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

