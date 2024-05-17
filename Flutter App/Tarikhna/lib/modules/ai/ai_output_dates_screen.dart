import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/shared/styles/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../models/AI_model.dart';
import '../../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class Ai_output_dates_screen extends StatelessWidget {
  const Ai_output_dates_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AICubit, AIStates>(
      listener: (BuildContext context, state) {
        // Handle listener events
      },
      builder: (BuildContext context, Object? state) {
        print("Listener");
        var cubit = AICubit.get(context);
        var data = cubit.AiModel?.data;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ConditionalBuilder(
                builder: (context) {
                  if (data != null &&
                      data.dates != null &&
                      data.dates!.isNotEmpty) {
                    // If there are dates available
                    return Column(
                      children: [
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
                        ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: data.dates!.length,
                          itemBuilder: (context, index) {
                            Dates date = data!.dates![index];
                            bool isFirst = index == 0;
                            bool isLast = index == data.dates!.length - 1;
                            return Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 200,
                                    child: TimelineTile(
                                      isFirst: isFirst,
                                      isLast: isLast,
                                      beforeLineStyle:
                                          LineStyle(color: AppColors8.navypurple),
                                      indicatorStyle: IndicatorStyle(
                                        width: 40,
                                        color: AppColors8.navypurple,
                                        iconStyle: IconStyle(
                                          iconData:
                                              Icons.arrow_downward_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  flex: 3,
                                ),
                                Expanded(
                                  flex: 26,
                                  child: TextSummarizedBuilder(date),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 1.0),
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  } else {
                    // No dates available
                    print("No dates available");
                    return Center(
                      child: Text("No dates available"),
                    );
                  }
                },
                condition: state is TextSummarizedSuccessState,
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget TextSummarizedBuilder(Dates date) {
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
                  date.date ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    // Adjust the fontSize as needed
                  ),
                ),)
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (String event in date.event ?? [])
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
                      if(date.event!.length > 1 )
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
}
