import 'package:fewaclothing/home_page.dart';
import 'package:fewaclothing/newarrival_page.dart';
import 'package:fewaclothing/profile_page.dart';
import 'package:fewaclothing/search_page.dart';
import 'package:fewaclothing/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';


class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {


  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;



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
        backgroundColor: Colors.pink,
        snakeViewColor: Colors.white,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp)),
          BottomNavigationBarItem(icon: Icon(Icons.search_sharp)),
          BottomNavigationBarItem(icon: Icon(Icons.new_releases_sharp)),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_sharp)),
          BottomNavigationBarItem(icon: Icon(Icons.person_sharp)),
        ],
      ),
    );

  }
}
