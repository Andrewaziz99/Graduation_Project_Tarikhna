import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/Exam/cubit/exam_cubit.dart';
import 'package:tarikhna/modules/Exam/examMain.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';
import 'package:tarikhna/modules/lessons/cubit/states.dart';
import 'package:tarikhna/shared/components/components.dart';

class ExamLeadingPage extends StatefulWidget {
  @override
  _ExamLeadingPageState createState() => _ExamLeadingPageState();
}

class _ExamLeadingPageState extends State<ExamLeadingPage> {
  late List<bool> _isSelected;
  List<String> selectedLessonIds = [];
  int level = 1;

  @override
  void initState() {
    super.initState();
    var cubit = LessonsCubit.get(context);
    _isSelected = List.generate(cubit.lesson?.data?.length ?? 0, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = LessonsCubit.get(context);
    return BlocConsumer<LessonsCubit, LessonsState>(
      listener: (context, state) {
        // Implement listener if needed
      },
      builder: (context, state) {
        print(cubit.lesson?.data?.length);
        return Scaffold(
          body: Column(
            children: [
              SizedBox(height: 20),
              Padding(
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
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ],
                ),
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
                children: List.generate(
                  5,
                      (index) => ElevatedButton(
                    onPressed: () {
                      setState(() {
                        level = index + 1;
                        print(level);
                      });
                    },
                    child: Text('${index + 1}'),
                  ),
                ).toList(),
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
              ConditionalBuilder(condition: cubit.lesson?.data!=null && cubit.lesson!.data!.isNotEmpty, builder:(context)=>Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: cubit.lesson?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      if (cubit.lesson?.data == null ||
                          cubit.lesson!.data!.isEmpty) {
                        return SizedBox.shrink();
                      }
                      var lesson = cubit.lesson!.data![index];
                      var lessonTitle = lesson.title ?? "Untitled Lesson";
                      return _buildCheckboxItem(context, lessonTitle, index);
                    },
                  ),
                ),
              ), fallback: (context)=>Center(child: CircularProgressIndicator(),)),

              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    var cubit = LessonsCubit.get(context);
                    var cubitExam = ExamCubit.get(context);
                    selectedLessonIds.clear(); // Clear the list before adding new selected lessons
                    for (int i = 0; i < cubit.lesson!.data!.length; i++) {
                      if (_isSelected[i]) {
                        selectedLessonIds.add(cubit.lesson!.data![i].sId!);
                      }
                    }
                    if (selectedLessonIds.isNotEmpty) {
                      print(selectedLessonIds);
                      cubitExam.getExamQuestions(selectedLessonIds, level);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.infoReverse,
                        animType: AnimType.bottomSlide,
                        title: 'Exam',
                        desc: 'You will have 3 minutes to answer 5 questions for each level.\nAre you ready to take the Exam?',
                        btnCancelOnPress: () {},
                        btnOkText: 'Start Exam',
                        btnOkOnPress: () {
                          navigateTo(context,  MainExamScreen(lessonIds: selectedLessonIds, level: level));

                        },
                      ).show();
                    } else {
                      print('Please select at least one lesson');
                    }
                  },
                  child: Text(
                    'Start Exam',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 228, 255),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCheckboxItem(BuildContext context, String label, int index) {
    if (index >= _isSelected.length) {
      // If the index is out of bounds, return an empty container
      return Container();
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(19, 0, 0, 0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          var cubit = LessonsCubit.get(context);
          var lessonId = cubit.lesson?.data?[index].sId;
          setState(() {
            // Toggle selection state
            _isSelected[index] = !_isSelected[index];
            print('Lesson ID: $lessonId, Selected: ${_isSelected[index]}');
          });
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
}
