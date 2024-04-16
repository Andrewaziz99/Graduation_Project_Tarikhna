import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class flutter_tts extends StatefulWidget {
  @override
  _flutter_ttsState createState() => _flutter_ttsState();
}

class _flutter_ttsState extends State<flutter_tts> {
  FlutterTts? flutterTts;
  String textToSpeech =
      'اهلا بكم في تاريخنا, تاريخنا هو تطبيق لتسهيل التعلم على الاطفال وجعل التعلم شئ ممتع و يجذب انتباههم . شكراً لكم لتجربتكم تطبيقُنا';

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
  }

  Future<void> _speak() async {
    await flutterTts!.setLanguage('ar');
    await flutterTts!.setPitch(1.0);
    await flutterTts!.speak(textToSpeech);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: _speak,
      child: Text('Start Lesson'),
    ));
  }
}
