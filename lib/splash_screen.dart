
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fewaclothing/bottom_navigator_page.dart';
import 'package:fewaclothing/home_page.dart';
import 'package:fewaclothing/login_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'signup_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String email;

  getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? "";
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen.withScreenFunction(
            screenFunction: () async {
              return email.isEmpty ? LoginPage() : BottomNavPage();
            },
            splash: Image.asset(
              'assets/images/download.jpg',
            ),
            splashTransition: SplashTransition.scaleTransition,
            pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.white));
  }
}
