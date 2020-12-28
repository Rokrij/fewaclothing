import 'package:fewaclothing/widgets/product_list_widget.dart';
import 'package:fewaclothing/widgets/search_bar_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.pink),
          title: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink, width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(context, 'cart');
                  }),
            )
          ],
        ),
        //body: Center(child: Text('Search Page')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarSlider(),
              ProductListWidget(),
            ],
          ),
        ));
  }
}
