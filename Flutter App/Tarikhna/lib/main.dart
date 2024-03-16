import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/layout/home_screen.dart';
import 'package:tarikhna/modules/ai/Saved_Item_Screen/Saved_Item_Screen.dart';
import 'package:tarikhna/modules/ai/cubit/cubit.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';
import 'package:tarikhna/modules/lessons/lessons_screen.dart';
import 'package:tarikhna/modules/login/login_screen.dart';
import 'package:tarikhna/modules/register/register_screen.dart';
import 'package:tarikhna/shared/bloc_observer.dart';
import 'package:tarikhna/shared/network/local/cache_helper.dart';
import 'package:tarikhna/shared/network/remote/dio_helper.dart';
import 'package:tarikhna/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    var token = CacheHelper.getData(key: 'token');
    int _selectedIndex = 2;
    String selectedPage = '';

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LessonsCubit()..getLessons()),
        BlocProvider(create: (context) => AICubit()..getAllSavedItem()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: Scaffold(
          body: homePage(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image(image: AssetImage('images/notification.png')),
                label: 'Notification',
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
                  icon: Image(image: AssetImage('images/rewards.png')),
                  label: 'Reward'),
              BottomNavigationBarItem(
                  icon: Image(image: AssetImage('images/bussiness-man.png')),
                  label: 'Profile')
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black54,
            onTap: _onItemTapped,
            elevation: 2.5,
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  decoration: BoxDecoration(
                    color: Color(0xFFFCE1B4), //F4ECE1FF
                  ),
                  child: Row(
                    children: [
                      Image(image: AssetImage('images/bussiness-man.png')),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Text(
                        'Nourhane Amir',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.save_alt),
                  title: const Text('Saved Items.'),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Save_Item_Screen()),
                      );
                      selectedPage = 'Saved Items';
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('Profile.'),
                  onTap: () {
                    setState(() {
                      selectedPage = 'Profile';
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings.'),
                  onTap: () {
                    setState(() {
                      selectedPage = 'Settings';
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About.'),
                  onTap: () {
                    setState(() {
                      selectedPage = 'About';
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.call),
                  title: const Text('Contact Us.'),
                  onTap: () {
                    setState(() {
                      selectedPage = 'Contact Us';
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('Help.'),
                  onTap: () {
                    setState(() {
                      selectedPage = 'Help';
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
