import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/ai/ai_input_screen.dart';
import 'package:tarikhna/modules/home/cubit/home_page_cubit.dart';
import 'package:tarikhna/modules/home/cubit/home_page_state.dart';
import 'package:tarikhna/modules/navbar/cubit/navbar_cubit.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/components/constants.dart';
import 'package:tarikhna/shared/styles/colors.dart';

class Home_Page_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String Greeting() {
      var time = DateTime.now().hour;
      if (time < 12) {
        return 'Good Morning!';
      } else if (time < 18) {
        return 'Good Afternoon!';
      } else {
        return 'Good Evening!';
      }
    }

    var size = MediaQuery.of(context).size;

    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        cubit.loadHome(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  Greeting(),
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textScaler: const TextScaler.linear(1.9),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ConditionalBuilder(
                                  condition: cubit.profileModel != null,
                                  builder: (BuildContext context) => Text(
                                    cubit.profileModel!.data!.name!,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  fallback: (BuildContext context) =>
                                      const Text('Iwy em hotep', style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.blue,
                                      ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    child: const Image(
                                        image:
                                            AssetImage('images/hand-wave.png')),
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
                CarouselSlider(
                  items: [
                    Image.network(img1),
                    Image.network(img2),
                    Image.network(img3),
                    Image.network(img4),
                    Image.network(img5),
                    Image.network(img6)
                  ],
                  options: CarouselOptions(
                    aspectRatio: 16/9,
                    height: 200.0,
                    initialPage: 0,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                onTap: () =>
                                    {navigateTo(context, AiInputScreen())},
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
