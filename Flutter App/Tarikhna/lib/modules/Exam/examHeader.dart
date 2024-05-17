import 'package:flutter/material.dart';
import 'const.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Exam",
          style: TextStyle(
              color: titleTextColor,
              fontSize: 45,
              fontWeight: FontWeight.w900,
              fontFamily: 'Roboto'),
        ),
      ]),
    );
  }
}
