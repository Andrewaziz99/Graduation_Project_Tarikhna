import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/models/Get_All_SavedItemmodel.dart';
import 'package:tarikhna/models/lesson_model.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';
import 'package:tarikhna/shared/styles/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../models/AI_Save_Item_model.dart';
import 'cubit/states.dart';


class Lesson_output_character_screen extends StatelessWidget {
  final String? id;

  Lesson_output_character_screen(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonsCubit, LessonsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = LessonsCubit.get(context);
        var lessonmodel = cubit.lesson;

        var data = lessonmodel?.data?.firstWhere((element) => element.sId == id);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  if (data != null && data.Characters != null && data.Characters!.isNotEmpty)
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
                            fontFamily: 'Roboto',
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  if (data != null && data.Characters != null && data.Characters!.isNotEmpty)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: data?.Characters?.length ?? 1,
                      itemBuilder: (context, index) {
                        CharacterModel? character = data!.Characters?[index];
                        DateModel dateModel = (data!.Dates!.isNotEmpty && index < data!.Dates!.length
                            ? DateModel.fromJson(data!.Dates![index].toJson())
                            : DateModel());

                        // Assuming DatesModel can be used as DateModel
                        DateModel date = DateModel(
                          sId: dateModel.sId,
                          date: dateModel.date,
                          event: dateModel.event,
                        );

                        bool isFirst = index == 0;
                        bool isLast = index >= (data!.Characters?.length)! - 1;
                        return Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 250,
                                child: TimelineTile(
                                  isFirst: isFirst,
                                  isLast: isLast,
                                  beforeLineStyle: LineStyle(color: AppColors8.navypurple),
                                  indicatorStyle: IndicatorStyle(
                                    width: 40,
                                    color: AppColors8.navypurple,
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
                              child: TextSummarizedBuilder(character, date, index, data.Characters!.length),
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



Widget TextSummarizedBuilder(CharacterModel? character, DateModel date, int index, int length) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        Container(
          constraints: BoxConstraints(minWidth: 300, minHeight: 100), // Minimum size constraints
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromARGB(255, 185, 212, 246),
            //border: Border.all(
             // color: Colors.black,
             // width: 1,
           // ),
          ),
          child: ListTile(
            title: Text(
              character?.events ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            leading: CircleAvatar(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0), // Add some padding to avoid text overflow
                  child: Text(
                    character?.nameOfCharacter ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              radius: 30,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

