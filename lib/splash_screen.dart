
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fewaclothing/bottom_navigator_page.dart';
import 'package:fewaclothing/login_page.dart';
import 'package:fewaclothing/providers/user_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen.withScreenFunction(
            screenFunction: () async {
              return Provider.of<UserAuthProvider>(context,listen:false).email.isEmpty ? LoginPage() : BottomNavPage();
            },
            splash: Image.asset(
              'assets/images/logo.png',
              height: 200,
              fit: BoxFit.cover,
            ),
            splashTransition: SplashTransition.scaleTransition,
            pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.white));
  }
}
