import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/ai/ai_input_screen.dart';
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/home/cubit/home_page_cubit.dart';
import 'package:tarikhna/modules/lessons/lessons_screen.dart';
import 'package:tarikhna/modules/navbar/cubit/navbar_cubit.dart';
export 'homePage.dart';
import 'package:tarikhna/shared/components/components.dart';

class Home_Page_Screen extends StatefulWidget {
  const Home_Page_Screen({super.key});

  @override
  State<Home_Page_Screen> createState() => _Home_Page_ScreenState();
}

class _Home_Page_ScreenState extends State<Home_Page_Screen> {
  @override
  Widget build(BuildContext context) {
    String name = "Nourhane";
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {
          if (state is SummaryAIState) {
            navigateTo(context, AiInputScreen());
          } else if (state is NavigateToLessonState) {
            // navigateTo(context, LessonsScreen());
          } else if (state is OpenDrawer) {}
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 100, horizontal: 50),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    'Good Morning!',
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textScaler: TextScaler.linear(1.9),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    name,
                                    textScaler: const TextScaler.linear(1.5),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      child: const Image(
                                          image: AssetImage(
                                              'images/hand-wave.png')),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 200),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: size.height * .225,
                        width: size.width * .8,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0x9BE7B7FD),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0),
                              bottomLeft: Radius.circular(40.0)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 35),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Start Learning",
                                        textScaler: TextScaler.linear(1.5),
                                      ),
                                      // Padding(
                                      //   padding: EdgeInsets.symmetric(
                                      //       horizontal: 5),
                                      // ),
                                      Container(
                                        height: 50,
                                        width: 40,
                                        child: const Image(
                                            image: AssetImage(
                                                'images/university1.png')),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 55,
                                  width: 80,
                                  child: const Image(
                                    image: AssetImage('images/studying1.png'),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.symmetric(horizontal: 5),
                                // ),
                                Container(
                                  height: 30,
                                  width: 190,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40.0),
                                        bottomRight: Radius.circular(40.0),
                                        topLeft: Radius.circular(40.0),
                                        bottomLeft: Radius.circular(40.0)),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        // padding:EdgeInsets.symmetric(horizontal: 0.5),
                                        height: 10,
                                        width: 20,
                                        child: const Image(
                                          image:
                                              AssetImage('images/search1.png'),
                                        ),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10)),
                                      Container(
                                        height: 20,
                                        width: 100,
                                        child: const Text(
                                          'Search',
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 430, horizontal: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 140,
                              child: const Text(
                                'Categories',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            children: [
                              Container(
                                height: 220,
                                width: size.width * .40,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFA0CBF9),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                      topLeft: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0)),
                                ),
                                child: InkWell(
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 30, horizontal: 20),
                                        child: Text(
                                          ' Summarize your history content',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Image(
                                            image: AssetImage(
                                                'images/business-report.png'),
                                          )),
                                    ],
                                  ),
                                  onTap: () => {
                                    AICubit.get(context),
                                    context.read<HomePageCubit>().getAISummary()
                                  },
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 220,
                                width: size.width * .40,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF6CADA),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                      topLeft: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0)),
                                ),
                                child: InkWell(
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Text('Lessons',
                                            textScaler: TextScaler.linear(1.8)),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 30),
                                          child: Image(
                                            image: AssetImage(
                                                'images/astrology.png'),
                                          )),
                                    ],
                                  ),
                                  onTap: () => {
                                    context.read<NavbarCubit>().getLessonPage()
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                alignment: Alignment.center,
                                height: 52,
                                width: 52,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFCE1B4),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  alignment: Alignment.center,
                                  icon: const Icon(Icons.menu),
                                  onPressed: () =>
                                      Scaffold.of(context).openEndDrawer(),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  // SafeArea(
                  //     child: nav_bar()
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
