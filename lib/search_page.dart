import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.search),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.pink),
      title: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.pink, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20),),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            SizedBox(
              width: 100,
              child: TextField(decoration: InputDecoration(
                  hintText: 'Search',
              border: InputBorder.none,
              ),
              ),
            ),
          ],
        ),
      ),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      //     child: Icon(Icons.qr_code),
      //   ),
      // ],
    ),
      //body: Center(child: Text('Search Page')),
      body: CustomScrollView(
        slivers:<Widget> [
          SliverToBoxAdapter(
            child: Container(
              height: 25,
              margin: EdgeInsets.only(top: 15,left: 10,right: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _tagItem("Hoodies"),
                  _tagItem("Jackets"),
                  _tagItem("Pants"),
                  _tagItem("Shoes"),
                  _tagItem("Shirts"),
                  _tagItem("Caps"),
                  _tagItem("Tees"),
                  _tagItem("Jeans"),
                  _tagItem("Bomber"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _tagItem(String title){
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      child: Container(child: Text(title,style: TextStyle(color: Colors.white), ),margin: EdgeInsets.all(5),),
      decoration: BoxDecoration(
        color: Colors.pink,
        border:Border.all(width: 1, color: Colors.pink),
        borderRadius: BorderRadius.all(Radius.circular(5),
        ),
      ),
    );
  }
}
