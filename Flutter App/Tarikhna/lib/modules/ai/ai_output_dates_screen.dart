import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
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
        AIModel? model = cubit.AiModel;

        // print(data?.dates.length);
        // print(data?.dates[2].date);
        // print(data?.dates[0].event);

        return Scaffold(
          backgroundColor: HexColor("FFF9F9"),
          appBar: AppBar(
            backgroundColor: HexColor("FFF9F9"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ConditionalBuilder(
                builder: (context) => Column(
                  children: [
                    if (data != null && data!.dates.isNotEmpty)
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
                      itemCount: data?.dates.length ?? 0,
                      itemBuilder: (context, index) {
                        // CharacterModel character = data!.characters[index];
                        DateModel? date =
                            data!.dates.isNotEmpty && index < data!.dates.length
                                ? data.dates[index]
                                : null;

                        bool First = index == 0;
                        bool Last =
                            index >= (model?.data?.dates.length ?? 0) - 1;

                        return Row(
                          children: [
                            Expanded(
                              child:  Row(
                                  children: [
                                    if (date?.date != null)
                                      Expanded(
                                        child: SizedBox(
                                          height: 250,
                                          child: TimelineTile(
                                            isFirst: First,
                                            isLast: Last,
                                            beforeLineStyle: LineStyle(
                                                color: HexColor('D3C5C5')),
                                            indicatorStyle: IndicatorStyle(
                                              width: 40,
                                              color: HexColor('D3C5C5'),
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

                                      child: TextSummarizedBuilder(
                                          date, index, data.characters.length),
                                      flex: 19,
                                    )

                                  ],
                                ),
                              ),

                          ],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 1.0,
                      ),

                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // if (data != null && data!.dates.isNotEmpty)
                    //   defaultButton(
                    //     function: () {},
                    //     text: "Save To Download ",
                    //     background: HexColor("5E8BFF"),
                    //     radius: 20.0,
                    //     fSize: 20.0,
                    //   )
                    if (data == null && data!.dates.isEmpty)
                      Material(
                        elevation: 10,
                        shadowColor: Colors.black,
                        borderOnForeground: true,
                        child: Text(
                          "Input Text Doesn't contain Dates",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'JacquesFrancois',
                          ),
                        ),
                      ),
                  ],
                ),
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

  Widget TextSummarizedBuilder(DateModel? date, int index, int totalItems) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        if (date?.date != null)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: HexColor('D3C5C5'),
            ),
            child: ListTile(
              title: Text(
                date?.event ?? '',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              leading: CircleAvatar(
                child: Text(
                  date?.date ?? '',
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
        // if (date != null && date.date != null && date.date!.isNotEmpty && index < totalItems -1 )
        //   Row(
        //     children: [
        //       //Image(image: NetworkImage("https://s3-alpha-sig.figma.com/img/6585/15d5/f9703581dffdd8933be8d33a8bcf3a98?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=BPkhFYN2WTg2WEwk3Ff636VBG2Tt2OWBJzbY55E8ZNGJr7RIvDzpjKq01qVVsxRNduIrVDF414KVwp8Ztn-VJKeAxZF9vj68DEphOjUvnq8uZs6OuXqRp8Unl9r~2HmsTDAOyNJUVNe7SYWULkpRzxucalXWkFeG420DGEu2Vn9WWkO5Yh99QGhNTNtvHvu8zjVgmFKuoKQw47jAu1iPhpecPaVUYIllrECS8QBKf~40d~vOY2ZBnLEJYNUOrwoC-3I67O~gcD09ZNmz0cqm-2MvVJA-Ze2ORbPodPEdAr71etOd-MqYlGqYuO17fU-jPVi-6FJiQd2Rh1J7nBCQWg__"),width: 30,height: 20,),
        //
        //       Container(
        //         width: 4.0, // width of the line
        //         height: 100.0, // height of the line
        //         color: HexColor('D3C5C5'),
        //       )
        //     ],
        //   )
      ]),
    );
  }
}
