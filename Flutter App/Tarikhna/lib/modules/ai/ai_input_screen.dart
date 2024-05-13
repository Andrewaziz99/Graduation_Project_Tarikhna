import 'dart:io';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/modules/ai/Navigation_Screen.dart';
import 'package:tarikhna/modules/ai/ai_output_screen.dart';
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/cubit/states.dart';
import 'package:tarikhna/shared/components/components.dart';

class AiInputScreen extends StatelessWidget {
  var inputTextController = TextEditingController();

  AiInputScreen({super.key});

  String fileName = '';
  String extractedText = '';
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
                const Center(
                  child: Material(
                    elevation: 10, // Set the elevation here

                    shadowColor: Colors.black,
                    borderOnForeground: true,

                    child: Text(
                      'Ai Summarization',
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
                  child: TextFormField(
                    controller: inputTextController,
                    keyboardType: TextInputType.multiline,
                    textDirection: TextDirection.rtl,
                    maxLines: 20,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.purple, width: 1.0),
                      ),
                      labelText: 'Enter the text here',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text("OR",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: HexColor('5E8BFF'))),
                const SizedBox(
                  height: 30.0,
                ),
                defaultButton(
                    background: HexColor('5E8BFF'),
                    // background: HexColor("5E8BFF"),
                    radius: 20.0,
                    fSize: 20.0,
                    function: () async{
                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                          allowMultiple: true,
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png', 'jpeg']);

                      if (result != null) {
                        List<File> files = result.paths.map((path) => File(path!)).toList();
                        for (File file in files) {
                          String fileName = file.path;
                          print(fileName);
                          String extractedText = await extractTextFromImg(file.path);
                          inputTextController.text = extractedText;
                          print(extractedText);
                        }
                      } else {
                        // User canceled the picker
                      }
                    }, text: 'Upload Image'),
                const SizedBox(
                  height: 15.0,
                ),
                //horizontl line
                // Container(
                //   height: 1,
                //   color: HexColor('5E8BFF'),
                // ),
                const SizedBox(
                  height: 30.0,
                ),
                defaultButton(
                  function: () {
                    AICubit.get(context)
                        .TextSummarization(inputData: inputTextController.text);
                    navigateTo(context, const Navigate_Screen());
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
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<String> extractTextFromImg(String pdfPath) async {
    List<String> languages = ['ara', 'eng'];
    String extractedText = await FlutterTesseractOcr.extractText(
      pdfPath,
      language: languages.first,);

    return extractedText;
  }


}



