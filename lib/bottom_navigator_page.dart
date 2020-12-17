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
  int _currentIndex=0;

  PageController _pageController = PageController(initialPage: 0);

  //final tabs=[
    //];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Center(child: HomePage()),
          Center(child: SearchPage()),
          Center(child: NewArrivalPage()),
          Center(child: WishListPage()),
          Center(child: ProfilePage()),

        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        backgroundColor: Colors.white,
        snakeViewColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.pink,
        currentIndex: _currentIndex,
        onTap: (index) => _pageController.animateToPage(index, duration: Duration(milliseconds: 350), curve: Curves.decelerate),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.new_releases_sharp)),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_sharp)),
          BottomNavigationBarItem(icon: Icon(Icons.person_sharp)),
        ],
      ),
    );

  }
}


// full restart gara ani check gara...video ma dekhako yeti nai ho