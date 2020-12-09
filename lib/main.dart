
import 'package:fewaclothing/bottom_navigator_page.dart';
import 'package:fewaclothing/cart_page.dart';
import 'package:fewaclothing/home_page.dart';
import 'package:fewaclothing/login_page.dart';
import 'package:fewaclothing/profile_page.dart';
import 'package:fewaclothing/search_page.dart';
import 'package:fewaclothing/signup_page.dart';
import 'package:fewaclothing/splash_screen.dart';
import 'package:fewaclothing/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
      theme: ThemeData(
        primaryColor: Colors.pink,
        textTheme: GoogleFonts.josefinSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routes: <String, WidgetBuilder>{
        'login': (BuildContext context) => LoginPage(),
        'signUp': (BuildContext context) => SignUpPage(),
        'home':(BuildContext context) => HomePage(),
        'nav': (BuildContext context) => BottomNavPage(),
        'splash': (BuildContext context) => SplashScreen(),
        'wishList': (BuildContext context) => WishListPage(),
        'search': (BuildContext context) => SearchPage(),
        'profile': (BuildContext context) => ProfilePage(),
        'cart': (BuildContext context) => CartPage(),
      },
      initialRoute: 'splash',
      debugShowCheckedModeBanner: false,

    );
  }
}
