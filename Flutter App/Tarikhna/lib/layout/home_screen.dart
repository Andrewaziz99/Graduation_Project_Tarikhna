//import 'package:ar_plugin_try_flutter/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarikhna/modules/ai/ai_input_screen.dart';
import 'package:tarikhna/modules/lessons/lessons_screen.dart';

//import 'drawer.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _home_pageState();
}

class _home_pageState extends State<homePage> {
  String name = "Nourhane";
  String selectedPage = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Row(
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
                              textScaler: TextScaler.linear(1.5),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: 30,
                                width: 30,
                                child: Image(
                                    image: AssetImage("images/hand-wave.png")),
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
                  decoration: BoxDecoration(
                    color: Color(0x9BE7B7FD),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0)),
                    // image: DecorationImage(
                    //     alignment: Alignment.centerLeft,
                    //     image: AssetImage("images/blender.png"))
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: Row(
                              children: [
                                Text(
                                  "Start Learning",
                                  textScaler: TextScaler.linear(1.5),
                                ),
                                // Padding(
                                //     padding:
                                //         EdgeInsets.symmetric(horizontal: 10)),
                                // Container(
                                //   height: 60,
                                //   width: 60,
                                //   child: Image(
                                //       image:
                                //           AssetImage('images/university1.png')),
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 80,
                            child: Image(
                              image: AssetImage('images/studying1.png'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                          ),
                          Container(
                            height: 25,
                            width: 190,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
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
                                  child: Image(
                                    image: AssetImage('images/search1.png'),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10)),
                                Container(
                                  height: 30,
                                  width: 100,
                                  child: Text(
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
              padding: EdgeInsets.symmetric(vertical: 430, horizontal: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 140,
                        child: Text(
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
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: [
                        InkWell(
                          child: Container(
                            height: 220,
                            width: size.width * .40,
                            decoration: BoxDecoration(
                              color: Color(0xFFA0CBF9),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                  topLeft: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 20),
                                  child: Text(
                                    ' Summarize your history content',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Image(
                                      image: AssetImage(
                                          'images/business-report.png'),
                                    )),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AiInputScreen()),
                            );
                          },
                        ),
                        Spacer(),
                        InkWell(
                          child: Container(
                            height: 220,
                            width: size.width * .40,
                            decoration: BoxDecoration(
                              color: Color(0xFFF6CADA),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                  topLeft: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text('Lessons',
                                      textScaler: TextScaler.linear(1.8)),
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 30),
                                    child: Image(
                                      image: AssetImage('images/astrology.png'),
                                    )),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LessonsScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.center,
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: Color(0xFFFCE1B4),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            alignment: Alignment.center,
                            icon: Icon(Icons.menu),
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
  }
}
