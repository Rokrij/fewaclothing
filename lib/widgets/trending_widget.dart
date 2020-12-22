import 'package:cached_network_image/cached_network_image.dart';
import 'package:fewaclothing/models/trending_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingWidget extends StatefulWidget {
  final TrendingItems items;
  @override
  _TrendingWidgetState createState() => _TrendingWidgetState();

  TrendingWidget(this.items);
}

class _TrendingWidgetState extends State<TrendingWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // go to product detail page and pass product.
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  child:
                  Image(
                    image: CachedNetworkImageProvider(widget.items.image),
                    fit: BoxFit.fill,
                    height: 170,
                    width: 250,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ],
            ),
            Container(
              width: 200,
              height: 50,
              padding: const EdgeInsets.only(left: 10,bottom: 10),
              child: Text(widget.items.name,
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(color: Colors.pink, fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
          ],
        ),
      ),
    );
  }

}
