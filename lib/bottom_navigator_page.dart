import 'package:fewaclothing/home_page.dart';
import 'package:fewaclothing/profile_page.dart';
import 'package:fewaclothing/search_page.dart';
import 'package:fewaclothing/wishlist_page.dart';
import 'package:flutter/material.dart';

import 'widgets/fewa_drawer.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex=0;

  final tabs=[
    Center(child: HomePage()),
    Center(child: SearchPage()),
    Center(child: WishListPage()),
    Center(child: ProfilePage()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: fewaDrawer(context),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.pink,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          iconSize: 25,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.pink),

            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.pink),

            BottomNavigationBarItem(
                icon: Icon(Icons.keyboard),
                label: 'WishList',
                backgroundColor: Colors.pink),

            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.pink),
          ],
          onTap:(index){
            setState(() {
              _currentIndex= index;
            });
          }
      ),
    );
  }
}
