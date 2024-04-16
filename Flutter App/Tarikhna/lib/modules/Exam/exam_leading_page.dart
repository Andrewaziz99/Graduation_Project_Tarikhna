//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/Exam/cubit/exam_cubit.dart';
import 'package:tarikhna/modules/Exam/examMain.dart';
import 'package:tarikhna/shared/components/components.dart';

class ExamLeadingPage extends StatelessWidget {
  ExamLeadingPage({super.key});

//   @override
//   State<ExamLeadingPage> createState() => _ExamLeadingPageState();
// }

// class _ExamLeadingPageState extends State<ExamLeadingPage> {
  int _selectedButtonIndex = -1;
  List<bool> _isSelected = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamCubit, ExamState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ChooseExam) {
          _selectedButtonIndex = state.selectedIndex;
          //context.read<ExamCubit>().update();
        }
      },
      child: BlocProvider(
        create: (context) => ExamCubit(),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            const Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Exam",
                      style: TextStyle(
                          color: Color.fromARGB(191, 0, 0, 0),
                          fontSize: 45,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Avenir'),
                    ),
                  ]),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                "Choose level",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<ExamCubit>().updateindex(0);

                    //_updateSelectedButtonIndex(0);
                  },
                  child: Text('1'),
                  style: _getButtonStyle(0),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ExamCubit>().updateindex(1);
                    //_updateSelectedButtonIndex(1);
                  },
                  child: Text('2'),
                  style: _getButtonStyle(1),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ExamCubit>().updateindex(2);
                    //_updateSelectedButtonIndex(2);
                  },
                  child: Text('3'),
                  style: _getButtonStyle(2),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ExamCubit>().updateindex(3);
                    //_updateSelectedButtonIndex(3);
                  },
                  child: Text('4'),
                  style: _getButtonStyle(3),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ExamCubit>().updateindex(4);
                    //_updateSelectedButtonIndex(4);
                  },
                  child: Text('5'),
                  style: _getButtonStyle(4),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                "Choose lessons",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildCheckboxItem('Lesson 1 Unit 1', 0),
                  _buildCheckboxItem('Lesson 2 Unit 1', 1),
                  _buildCheckboxItem('Lesson 3 Unit 1', 2),
                  _buildCheckboxItem('Lesson 1 Unit 2', 3),
                  _buildCheckboxItem('Lesson 2 Unit 2', 4),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () => {navigateTo(context, MainExamScreen())},
                child: Text(
                  'Start Exam',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 228, 255)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxItem(String label, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(19, 0, 0, 0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          // setState(() {
          //   _isSelected[index] = !_isSelected[index];
          // });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _isSelected[index] ? Colors.blue : Colors.grey,
                    width: 2.0,
                  ),
                ),
                child: _isSelected[index]
                    ? Icon(
                        Icons.check,
                        size: 16.0,
                        color: Colors.blue,
                      )
                    : null,
              ),
              SizedBox(width: 8.0),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }

  // void _handleCheckboxValueChanged(bool? value, int index) {
  //   setState(() {
  //     _isSelected[index] = value ?? false; // Update selection
  //   });
  // }

  ButtonStyle _getButtonStyle(int buttonIndex) {
    Color buttonColor;
    switch (buttonIndex) {
      case 0:
        buttonColor =
            _selectedButtonIndex == 0 ? Colors.greenAccent : Colors.white;

        break;
      case 1:
        buttonColor =
            _selectedButtonIndex == 1 ? Colors.amberAccent : Colors.white;

        break;
      case 2:
        buttonColor = _selectedButtonIndex == 2 ? Colors.amber : Colors.white;

        break;
      case 3:
        buttonColor =
            _selectedButtonIndex == 3 ? Colors.orangeAccent : Colors.white;

        break;
      case 4:
        buttonColor =
            _selectedButtonIndex == 4 ? Colors.redAccent : Colors.white;

        break;
      default:
        buttonColor = Colors.white; // Default color
        break;
    }

    return ElevatedButton.styleFrom(
      elevation: buttonIndex == _selectedButtonIndex ? 8 : 2,
      backgroundColor: buttonColor,
      // Adjust elevation and color based on selection
    );
  }

  // void _updateSelectedButtonIndex(int newIndex) {
  //   setState(() {
  //     _selectedButtonIndex = newIndex;
  //   });
  // }
}
