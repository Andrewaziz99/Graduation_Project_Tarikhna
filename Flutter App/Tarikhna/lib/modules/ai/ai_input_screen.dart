import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/modules/ai/Navigation_Screen.dart';
import 'package:tarikhna/modules/ai/ai_output_screen.dart';
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/cubit/states.dart';
import 'package:tarikhna/shared/components/components.dart';

class AiInputScreen extends StatelessWidget {
  var inputTextController = TextEditingController();

  AiInputScreen({super.key});

  // var cubit = AppCubit.get(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AICubit, AIStates>(listener: (context, state) {
      // if (state is TextSummarizedSuccessState) {
      //   if (state.AiModel?.historicalORNot == true) {
      //     // navigateTo(context, AiOutputScreen());
      //   } else {
      //     CherryToast.error(
      //       title: const Text('This is not a historical text'),
      //       autoDismiss: true,
      //       toastPosition: Position.bottom,
      //       animationType: AnimationType.fromLeft,
      //       toastDuration: const Duration(seconds: 5),
      //       animationDuration: const Duration(milliseconds: 500),
      //     ).show(context);
      //     print('not historical');
      //   }
      // }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: HexColor("FFF9F9"),
        appBar: AppBar(
          backgroundColor: HexColor("FFF9F9"),
          //
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: Material(
                    elevation: 10, // Set the elevation here

                    shadowColor: Colors.black,
                    borderOnForeground: true,

                    child: Text(
                      'AI Summarization',
                      style: TextStyle(
                          fontSize: 35, // Adjust font size as needed
                          fontWeight: FontWeight.bold,
                          fontFamily: 'JacquesFrancois'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                Container(
                  color: HexColor('E8EA8D'),
                  height: 350.0,
                  child: defaultFormField(
                      bordercoler: Colors.black,
                      textDir: TextDirection.rtl,
                      controller: inputTextController,
                      type: TextInputType.text,
                      label: 'Text Input',
                      numOfLines: 20,
                      validate: (value) {
                        print('valid');
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                defaultButton(
                  function: () {
                    AICubit.get(context)
                        .TextSummarization(inputData: inputTextController.text);
                    navigateTo(context, Navigate_Screen());
                  },
                  text: 'Summarize',
                  background: HexColor('5E8BFF'),
                  // background: HexColor("5E8BFF"),
                  radius: 20.0,
                  fSize: 20.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Spacer(),
                    // Image(
                    //     width: 200.0,
                    //     height: 200.0,
                    //     image: NetworkImage(
                    //         'https://s3-alpha-sig.figma.com/img/8e09/eedf/3277c2a4f41333d2c8e57c68878934e4?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FE66zTa9UK2BsPWoZ~VKNeTG4PH46lK6T2HYXcGZvh~qjOkWG4GuN6uZJ59FmemW0utxZx7EeDzIoKuHENGAZC4sQLH0xN1ppGBjLuMm04vvsHq5oAS3H7SYuVhbXkoLVfCElvCpg8ARiTXcaBOdhoNffQTiqxKeOznxkmJ8bXVs5jYoZ0CXx-Chy~ZDQMVDcxcwOOkcySRKwCS2YK2RqOkb-mbH8rnV4lIguwJ5MtBK~BILF8O06HNW2MbDDb-7PynuZJx9sfLa3IPyhy5UrqWwQDvc7U-Zz4y4xiZu2PEOJkQghEC5Jr25AYLdseZreGamno4vhCDHXvhYM7IL9A__')),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
