import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/shared/cubit/cubit.dart';
import 'package:tarikhna/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tari5na'),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar:BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.text_format),
                label: 'Summarize Text',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.text_snippet),
                label: 'Output Summary',
              ),
            ],
          ),
    );
  },
    );
  }
}
