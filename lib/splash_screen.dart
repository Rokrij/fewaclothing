import 'dart:async';
import 'package:animated/animated.dart';
import 'package:fewaclothing/providers/user_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // String email;

  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, goToAnotherScreen);
  }

  goToAnotherScreen() {
    if (Provider.of<UserAuthProvider>(context,listen:false).email.isEmpty) {
      Navigator.pushReplacementNamed(context, 'login');
    } else {
      Navigator.pushReplacementNamed(context, 'nav');
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Animated(
              value: 1.2,
              curve: Curves.easeInOutBack,
              duration: Duration(milliseconds: 500),
              builder: (context, child, animation) => Transform.scale(
                scale: animation.value,
                child: child,
              ),
              child: Image.asset('assets/images/3.png',height: 250,width: 250,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:600),
            child: Center(child: Text('from',style: GoogleFonts.cantarell(
              textStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 20),
            ),
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:675),
            child: Center(child: Text('ROKRIJ SHRESTHA',style: GoogleFonts.cantarell(
              textStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}