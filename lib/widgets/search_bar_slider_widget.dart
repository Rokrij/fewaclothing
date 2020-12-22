import 'package:flutter/material.dart';

class SearchBarSlider extends StatefulWidget {
  @override
  _SearchBarSliderState createState() => _SearchBarSliderState();
}

class _SearchBarSliderState extends State<SearchBarSlider> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      slivers:<Widget> [
        SliverToBoxAdapter(
          child: Container(
            height: 25,
            margin: EdgeInsets.only(top: 15,left: 8,right: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _tagItem(("Featured")),
                _tagItem("Hoodies"),
                _tagItem("Jackets"),
                _tagItem("Pants"),
                _tagItem("Shoes"),
                _tagItem("Shirts"),
                _tagItem("Caps"),
                _tagItem("Tees"),
                _tagItem("Jeans"),
                _tagItem("Bomber"),
                _tagItem("Watches"),
                _tagItem("Belts")
              ],
            ),
          ),
        )
      ],
    );

  }
  Widget _tagItem(String title){
    return Container(
      margin: EdgeInsets.only(left: 10,right: 5),
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
