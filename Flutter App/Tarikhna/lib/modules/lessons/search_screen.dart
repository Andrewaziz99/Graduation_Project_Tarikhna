import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';
import 'package:tarikhna/modules/lessons/cubit/states.dart';
import 'package:tarikhna/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonsCubit, LessonsState>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit  = LessonsCubit.get(context);
        var searchLesson = cubit.searchLesson?.data;
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/background.png', fit: BoxFit.cover),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Center(child: Text('Search')),
              ),
              body: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          cubit.search(value);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for lessons',
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.search(searchController.text);
                            },
                            icon: const Icon(Icons.search_outlined),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ConditionalBuilder(
                      condition: searchLesson != null,
                      builder: (BuildContext context) => ListView.separated(
                          itemBuilder: (context, index) =>
                              lessonItemBuilder(searchLesson![index]),
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            height: 10.0,
                          ),
                          itemCount: searchLesson!.length),
                      fallback: (BuildContext context) {
                        if (cubit.lesson?.status == false)
                          return Center(
                              child: Text('${cubit.lesson!.message}'));
                        else if (searchController.text.isEmpty)
                          return Center(
                              child: Text('No lessons found yet!'));
                        else
                          return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
              ]),
            ),
          ],
        );
      },
    );
  }
}
