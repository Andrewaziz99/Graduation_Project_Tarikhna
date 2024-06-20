import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tarikhna/modules/arModule/ar_statless_main.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';
import 'package:tarikhna/modules/lessons/cubit/states.dart';
import 'package:tarikhna/modules/lessons/search_screen.dart';
import 'package:tarikhna/modules/quiz/quiz_screen.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/styles/colors.dart';
import 'Lesson_Navigate_screen.dart';


void showLessonBottomSheet(String id) {
  scaffoldkey.currentState?.showBottomSheet((context) => Container(
    width: double.infinity,
    height: 300,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 50),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Adjust button size
                backgroundColor:HexColor("B1AEFC")
               , // Change button color
              ),
              onPressed: () {
                navigateTo(context, Lesson_Navigate_Screen(id));
              },
              child: const Text("Summary",style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 50),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Adjust button size
                backgroundColor:HexColor("94D5B2"), // Change button color
              ),
              onPressed: () {
                navigateTo(context, Ar_Main_screen());
              },
              child: const Text('Ar Model',style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Adjust button size
            backgroundColor:HexColor("FDA3BF"), // Change button color
          ),
          onPressed: () {
            LessonsCubit.get(context).changeDialogState();
            AwesomeDialog(
              context: context,
              dialogType: DialogType.infoReverse,
              animType: AnimType.bottomSlide,
              title: 'Quiz',
              desc: 'You will have 3 minutes to answer 5 questions for each level.\nAre you ready to take the quiz?',
              btnCancelOnPress: () {},
              btnOkText: 'Start Quiz',
              btnOkOnPress: () {
                navigateTo(context, QuizScreen(id));
              },
            ).show();
            // navigateTo(context, QuizScreen(id));
          },
          child: const Text('Quiz',style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  ));
}

var scaffoldkey = GlobalKey<ScaffoldState>();

class LessonsScreen extends StatelessWidget {


  var searchController = TextEditingController();

  LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonsCubit, LessonsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = LessonsCubit.get(context);
        var lesson = cubit.lesson?.data;
        return Stack(
          fit: StackFit.expand,
          children: [
          
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: CustomPrimaryColor,
                height: 400,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: -150,
                      right: -250,
                      child: Tcircularcontainer(
                        backgroundColor: CustomPrimaryColor.withOpacity(0.2),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: -300,
                      child: Tcircularcontainer(
                        backgroundColor: CustomPrimaryColor.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Scaffold(
              key: scaffoldkey,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Center(child: Text('Lessons',style: TextStyle(fontSize: 25.0),
                    
                          )),
                actions: [
                  IconButton(
                    onPressed: () {
                      navigateTo(context, SearchScreen());
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filters',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(Icons.filter_alt_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultButton(
                          background: Colors.white,
                          radius: 20.0,
                          width: 130,
                          text: 'All Lessons',tColor: Colors.black,
                          function: () {
                            cubit.getLessons();
                          },
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        defaultButton(
                          background:  Colors.white,
                          radius: 20.0,
                          width: 130,
                          text: 'New Lessons',tColor: Colors.black,
                          function: () {
                            cubit.filterLesson(1);
                          },
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        defaultButton(
                            background:  Colors.white,
                            radius: 20.0,
                            width: 130,
                            function: () {
                              cubit.filterLesson(2);
                            },
                            text: 'In Progress',tColor: Colors.black),
                        const SizedBox(
                          width: 20.0,
                        ),
                        defaultButton(
                            background:Colors.white,
                            radius: 20.0,
                            width: 130,
                            function: () {
                              cubit.filterLesson(3);
                            },
                            text: 'done',tColor: Colors.black),
                        const SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ConditionalBuilder(
                        condition: lesson != null,
                        builder: (BuildContext context) => ListView.separated(
                            itemBuilder: (context, index) =>
                                lessonItemBuilder(lesson[index]),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10.0,
                                ),
                            itemCount: lesson!.length),
                        fallback: (BuildContext context) {
                          if (cubit.lesson?.status == false) {
                            return Center(
                                child: Text('${cubit.lesson!.message}'));
                          } else {
                            return const Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
class Tcircularcontainer extends StatelessWidget {

  const Tcircularcontainer({
    super.key,
    this.child,
    this.width=400,
    this.height=400,
    this.radius=400,
    this.backgroundColor=Colors.white,
    this.padding=0,

  });
  final double?width;
  final double?height;
  final double?padding;
  final Widget?child;
  final double?radius;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: Colors.white.withOpacity(0.6),

      ),
    );
  }
}
     




Widget lessonItemBuilder(model) => Material(
  elevation: 5, // Set the elevation value
  borderRadius: BorderRadius.circular(15.0),
  child: Container(
    
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.white,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // print(model.sId);
              showLessonBottomSheet(model!.sId!);
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${model.title}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Unit ${model.unit}',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[800],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);
