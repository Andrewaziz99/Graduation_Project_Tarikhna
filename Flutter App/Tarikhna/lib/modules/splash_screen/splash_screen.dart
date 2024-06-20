
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:tarikhna/modules/login/login_screen.dart';
import 'package:tarikhna/modules/navbar/navbar.dart';
import 'package:tarikhna/shared/network/local/cache_helper.dart';
import 'package:tarikhna/shared/styles/colors.dart';

class Splash_screen extends StatelessWidget {
  bool token = CacheHelper.getData(key: 'token') == null ? false : true;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/splash.png',
      nextScreen: token ? NavBar_Page() : LoginScreen(),
      splashTransition: SplashTransition.rotationTransition,
      animationDuration: Duration(seconds: 2),
      duration: 3000,
      splashIconSize: 300,
      backgroundColor: CustomPrimaryColor,
    );
  }
}
