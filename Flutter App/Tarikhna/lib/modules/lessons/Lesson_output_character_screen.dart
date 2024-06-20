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
        var lessonModel = cubit.lesson;

        var data = lessonModel?.data?.firstWhere((element) => element.sId == id);

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
                      itemCount: data.Characters!.length,
                      itemBuilder: (context, index) {
                        CharacterModel? character = data.Characters?[index];
                        DateModel dateModel = (data.Dates!.isNotEmpty && index < data.Dates!.length
                            ? DateModel.fromJson(data.Dates![index].toJson())
                            : DateModel());

                        bool isFirst = index == 0;
                        bool isLast = index >= data.Characters!.length - 1;
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
                              child: TextSummarizedBuilder(character, index, data.Characters!.length),
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

Widget TextSummarizedBuilder(CharacterModel? character, int index, int length) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        Column(
          children: [
            if (character?.nameOfCharacter != null)
              Container(
                constraints: BoxConstraints(minWidth: 300, minHeight: 100), // Minimum size constraint
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 185, 212, 246),
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
                            for (String event in character.events ?? [])
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
                                      SizedBox(
                                        width: 10,
                                        child: Text('•', style: TextStyle(fontSize: 40)), // Bullet
                                      ),
                                    ],
                                  ),
                                  if (character.events!.length > 1)
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.white,
                                    )
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
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      character?.nameOfCharacter ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 10
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
