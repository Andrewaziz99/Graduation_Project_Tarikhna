import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/modules/ai/Navigation_Screen.dart';
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/ai/cubit/states.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:tarikhna/shared/styles/colors.dart';

class AiInputScreen extends StatelessWidget {
  var inputTextController = TextEditingController();
  bool _hasText = true;
  AiInputScreen({super.key});

  String fileName = '';
  String extractedText = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AICubit, AIStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: HexColor("FFF9F9"),
          appBar: AppBar(
            backgroundColor: HexColor("FFF9F9"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Center(
                    child: Material(
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      child: Text(
                        'Ai Summarization',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue ,width: 3),
                      //const Color.fromARGB(255, 51, 50, 50)),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          //AppColors4.navyblue
                          //Colors.white.withOpacity(0.7),
                         spreadRadius: 3,
                          blurRadius: 7,
                         offset: Offset(3,3),
                        ),
                      ],
                       color: Colors.white.withOpacity(0.9), // Adjust opacity for glassy effect
                    ),
                    height: 350.0,
                    child: TextFormField(
                      controller: inputTextController,
                      keyboardType: TextInputType.multiline,
                      textDirection: TextDirection.rtl,
                      maxLines: 20,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Enter the text here',
                        alignLabelWithHint: true,
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: _hasText ? Colors.black : Colors.blue,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(85.0,0.0, 0.0, 0.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: HexColor('5E8BFF'),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles(
                            allowMultiple: true,
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'png', 'jpeg'],
                          );
                          if (result != null) {
                            List<File> files = result.paths.map((path) => File(path!)).toList();
                            for (File file in files) {
                              String fileName = file.path;
                              print(fileName);
                              String extractedText = await extractTextFromImg(file.path);
                              inputTextController.text += extractedText;
                              print(extractedText);
                            }
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: Row(
                          children: [
                            //Icon(Icons.image, color: Colors.red),
                             Image.asset("images/photo.png"),

                            SizedBox(width: 1),
                            Text(
                              'Upload image',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles(
                            allowMultiple: true,
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );
                          if (result != null) {
                            List<File> files = result.paths.map((path) => File(path!)).toList();
                            for (File file in files) {
                              String fileName = file.path;
                              print(fileName);
                              String extractedText = await extractTextFromPdf(file.path);
                              inputTextController.text += extractedText;
                              print(extractedText);
                            }
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: Row(
                          children: [
                            //Icon(Icons.upload_file, color: Colors.red),
                             Image.asset("images/upload.png"),
                            SizedBox(width: 3),
                            Text(
                              'Upload pdf',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AICubit.get(context).TextSummarization(inputData: inputTextController.text);
                      navigateTo(context, const Navigate_Screen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Icon(Icons.summarize_sharp, color: Colors.black),
                         Image.asset("images/contract.png"),
                        SizedBox(width:5),
                        Text(
                          'Summarize',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                     maximumSize: Size(250, 70)
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<String> extractTextFromImg(String imagePath) async {
    List<String> languages = ['ara', 'eng'];
    String extractedText = await FlutterTesseractOcr.extractText(
      imagePath,
      language: languages.first,
    );
    return extractedText;
  }

  Future<String> extractTextFromPdf(String pdfPath) async {
    PdfDocument document = PdfDocument(inputBytes: File(pdfPath).readAsBytesSync());
    String extractedText = PdfTextExtractor(document).extractText(startPageIndex: 0);
    document.dispose();
    return extractedText;
  }
}
