import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/models/lesson_model.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';
import 'package:tarikhna/modules/lessons/cubit/states.dart';
import 'package:tarikhna/shared/components/components.dart';

class LessonsScreen extends StatelessWidget {
  var searchController = TextEditingController();

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
            Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Center(child: Text('Lessons')),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: defaultFormField(
                        radius: const BorderRadius.all(Radius.circular(20)),
                        prefix: Icons.search_outlined,
                        controller: searchController,
                        type: TextInputType.text,
                        label: 'Search for lessons',
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Search must not be empty';
                          }
                          return null;
                        },
                        onChange: (value) {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
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
                          background: Colors.blue.withOpacity(0.85),
                          radius: 20.0,
                          width: 150,
                          text: 'New Lessons',
                          function: () {},
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        defaultButton(
                            background: Colors.blue.withOpacity(0.85),
                            radius: 20.0,
                            width: 150,
                            function: () {},
                            text: 'In Progress'),
                        const SizedBox(
                          width: 10.0,
                        ),
                        defaultButton(
                            background: Colors.blue.withOpacity(0.85),
                            radius: 20.0,
                            width: 150,
                            function: () {},
                            text: 'done'),
                        const SizedBox(
                          width: 10.0,
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
                                lessonItemBuilder(lesson![index]),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10.0,
                                ),
                            itemCount: lesson!.length),
                        fallback: (BuildContext context) {
                          if(cubit.lesson?.status == false)
                            return Center(child: Text('${cubit.lesson!.message}'));
                          else
                            return Center(child: CircularProgressIndicator());
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

Widget lessonItemBuilder(Data model) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Container(
              height: 120.0,
              color: Colors.white.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            height: 10.0,
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
                    const Spacer(),
                    defaultButton(
                      background: Colors.blue.withOpacity(0),
                      tColor: Colors.blue,
                      fSize: 16.0,
                      radius: 20.0,
                      width: 100,
                      function: () {},
                      text: 'Start',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
