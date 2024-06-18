import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/Exam/exam_leading_page.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/Saved_Item_Screen.dart';
import 'package:tarikhna/modules/home/homepage.dart';
import 'package:tarikhna/modules/lessons/lessons_screen.dart';
import 'package:tarikhna/modules/navbar/cubit/navbar_cubit.dart';
import 'package:tarikhna/modules/profile/progressBar.dart';

class NavBar_Page extends StatefulWidget {
  const NavBar_Page({super.key});

  @override
  State<NavBar_Page> createState() => _NavBar_PageState();
}

class _NavBar_PageState extends State<NavBar_Page> {
  final _pageNavigation = [
    // NotificationPage(),
    Save_Item_Screen(),
    LessonsScreen(),
    Home_Page_Screen(),
    //AR_Main(),
    ExamLeadingPage(),
    Profile_Page_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNav(),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    /// Check if index is in range
    /// else return Not Found widget
    ///

    return _pageNavigation.elementAt(index);
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      elevation: 2.5,
      selectedItemColor: Colors.black,
      currentIndex: context.read<NavbarCubit>().state,
      type: BottomNavigationBarType.fixed,
      onTap: _getChangeBottomNav,
      items: const [
        BottomNavigationBarItem(
          icon: Image(image: AssetImage('images/saveditems.png')),
          label: 'Saved Items',
        ),
        BottomNavigationBarItem(
          icon: Image(image: AssetImage('images/books.png')),
          label: 'Lessons',
        ),
        BottomNavigationBarItem(
          icon: Image(image: AssetImage('images/home.png')),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Image(image: AssetImage('images/open-book.png')),
            label: 'Exam'),
        BottomNavigationBarItem(
            icon: Image(image: AssetImage('images/bussiness-man.png')),
            label: 'Profile'),
      ],
    );
  }

  void _getChangeBottomNav(int index) {
    context.read<NavbarCubit>().updateIndex(index);
  }
}