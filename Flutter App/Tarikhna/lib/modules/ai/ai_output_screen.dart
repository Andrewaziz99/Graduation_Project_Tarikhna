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
        // if (state is TextSummarizedLoadingState) {
        //   // Handle loading state
        // }
        //
        // if (state is TextSummarizedSuccessState) {
        //   print('Success');
        // }
      },
      builder: (BuildContext context, Object? state) {
        print("Listener");
        print(AICubit.get(context).AiModel?.data?.characters.length);
        var cubit = AICubit.get(context);
        var data = cubit.AiModel?.data;
        print(data?.characters.length);
        CharacterModel? characterModel;

        return Scaffold(
          backgroundColor: HexColor("FFF9F9"),
          appBar: AppBar(
            backgroundColor: HexColor("FFF9F9"),
            // title: const Text('AI Output'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ConditionalBuilder(
                condition: state is TextSummarizedSuccessState,
                builder: (context) => Column(
                  children: [
                    if (data?.characters[0].nameOfCharacter != null)
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
                      itemCount: data?.characters.length ?? 0,
                      itemBuilder: (context, index) {
                        CharacterModel character = data!.characters[index];
                        DateModel? date =
                            data.dates.isNotEmpty && index < data.dates.length
                                ? data.dates[index]
                                : null;

                        bool First = index == 0;
                        bool Last = index == data!.characters.length - 1;
                        return Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 250,
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
                              child: TextSummarizedBuilder(character, date,
                                  index, data.characters.length),
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

  Widget TextSummarizedBuilder(
      CharacterModel character, DateModel? date, int index, int totalindex) {
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
                      title: Text(
                        character.events ?? '',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      leading: CircleAvatar(
                        child: Text(
                          character.nameOfCharacter ?? '',
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
        ));
  }
}
