import 'package:fewaclothing/home_page.dart';
import 'package:fewaclothing/newarrival_page.dart';
import 'package:fewaclothing/profile_page.dart';
import 'package:fewaclothing/search_page.dart';
import 'package:fewaclothing/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'widgets/fewa_drawer.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {

  ShapeBorder bottomBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = EdgeInsets.all(12);

  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = true;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.white;
  Color unselectedColor = Colors.white;

  int _currentIndex=0;

  final tabs=[
    Center(child: HomePage()),
    Center(child: SearchPage()),
    Center(child: NewArrivalPage()),
    Center(child: WishListPage()),
    Center(child: ProfilePage()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: fewaDrawer(context),
      body: tabs[_currentIndex],
      bottomNavigationBar: SnakeNavigationBar.color(
        elevation: 0,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
         padding: padding,
        backgroundColor: Colors.pink,
        snakeViewColor: Colors.white,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(icon: Icon(Icons.calculate)),
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
          BottomNavigationBarItem(icon: Icon(Icons.search))
        ],
      ),
    );

  }
}
