import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

class PDFScreen extends StatelessWidget {

  String fileName = '';
  String extractedText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            defaultButton(
              width: 100,
              radius: 10.0,
              text: 'Pick PDF',
              function: () async{

                FilePickerResult? result = await FilePicker.platform.pickFiles();

                if (result != null) {
                  File file = File(result.files.single.path!);
                  fileName = file.path;
                  print(fileName);
                  extractedText = await extractTextFromPdf(file.path);
                  print(extractedText);
                } else {
                  // User canceled the picker
                }
              },
            ),
            const SizedBox(width: 20.0),
            Text(fileName),
          ],
        ),
      ),
    );
  }

  Future<String> extractTextFromPdf(String pdfPath) async {
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // String tessDataDirPath = '${appDocDir.path}/tessdata';

    // Specify the language(s) used for OCR (e.g., 'eng' for English)
    List<String> languages = ['ara', 'eng'];


    // final Uint8List bytes = pdfPath.buffer.asUint8List();
    // Perform OCR on the PDF file
    String extractedText = await FlutterTesseractOcr.extractText(
        pdfPath,
        language: languages.first,);

    return extractedText;
  }

}
