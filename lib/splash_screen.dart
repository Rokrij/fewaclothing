
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fewaclothing/bottom_navigator_page.dart';
import 'package:fewaclothing/login_page.dart';
import 'package:fewaclothing/providers/user_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        body: Stack(
          children: [AnimatedSplashScreen.withScreenFunction(
            // animationDuration: Duration(milliseconds: 500),
              screenFunction: () async {
                return Provider.of<UserAuthProvider>(context,listen:false).email.isEmpty ? LoginPage() : BottomNavPage();
              },
              splash: Image.asset(
                'assets/images/3.png',
                height: 200,
                fit: BoxFit.fitWidth,
              ),
              centered: true,
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: Colors.white),
          Padding(
            padding: const EdgeInsets.only(top:500),
            child: Center(child: Text('from',style: GoogleFonts.cantarell(
              textStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 20),
            ),
            ),
            ),
          ),Padding(
            padding: const EdgeInsets.only(top:575),
            child: Center(child: Text('ROKRIJ SHRESTHA',style: GoogleFonts.cantarell(
              textStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),)),
          ),

          ],
        ),
    );
  }
}
