import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/models/AI_model.dart';
import 'package:tarikhna/modules/ai/ai_output_dates_screen.dart';
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/cubit/states.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AiOutputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AICubit, AIStates>(
      listener: (BuildContext context, state) {
        // Handle listener events if needed
      },
      builder: (BuildContext context, Object? state) {
        print("Listener");
        var cubit = AICubit.get(context);
        var data = cubit.AiModel?.data;
        CharactersModel? characterModel;

        return Scaffold(
          backgroundColor: HexColor("FFF9F9"),
          appBar: AppBar(
            backgroundColor: HexColor("FFF9F9"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ConditionalBuilder(
                condition: state is TextSummarizedSuccessState,
                builder: (context) => Column(
                  children: [
                    if (data != null && data.characters != null && data.characters!.isNotEmpty)
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
                      itemCount: data?.characters?.length ?? 0,
                      itemBuilder: (context, index) {
                        CharactersModel character = data!.characters![index];



                        bool First = index == 0;
                        bool Last = index == data.characters!.length - 1;

                        return Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 400,
                                child: TimelineTile(
                                  isFirst: First,
                                  isLast: Last,
                                  beforeLineStyle:
                                  LineStyle(color: HexColor('D3C5C5')),
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
                              flex: 3,
                            ),
                            Expanded(
                              child: TextSummarizedBuilder(
                                character),
                              flex: 19,
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

  Widget TextSummarizedBuilder( CharactersModel character) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Column(
            children: [
              if (character.nameOfCharacter != null)
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
                            if (character.events != null && character.events!.isNotEmpty)
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
                                        // SizedBox(width: 1),
                                        SizedBox(
                                          width: 10,
                                          // Adjust the space between the bullet and the text
                                          child: Text('•', style: TextStyle(fontSize: 40)), // Bullet
                                        ),
                                      ],
                                    ),
                                    if(character.events!.length >1)
                                      Container(width: double.infinity,height:
                                      1,color: Colors.white,) // Add space between events
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
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          character.nameOfCharacter ?? '',
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


}

