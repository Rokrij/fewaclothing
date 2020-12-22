import 'package:cached_network_image/cached_network_image.dart';
import 'package:fewaclothing/models/product.dart';
import 'package:fewaclothing/product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ProductWidget extends StatefulWidget {
  final FewaProduct product;

  ProductWidget(this.product);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool _wishlist = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: ProductDetails(widget.product)));
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
                  image: CachedNetworkImageProvider(widget.product.image),
                  fit: BoxFit.fill,
                  height: 170,
                  width: 250,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
                IconButton(
                  icon: (_wishlist
                      ? Icon(Icons.favorite_border_sharp,color: Colors.pink)
                      : Icon(Icons.favorite_sharp,color: Colors.pink)),
                  onPressed: () {
                    setState(() {
                      _wishlist = !_wishlist;
                    },
                    );
                  },
                ),
              ],
            ),
            Container(
              width: 200,
              height: 50,
              padding: const EdgeInsets.only(left: 10,bottom: 10),
              child: Text(widget.product.name,
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(color: Colors.pink, fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,bottom: 10),
              child: Text('Rs. ${widget.product.price}',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(color: Colors.pink, fontSize: 15),
                  ),),
            ),
          ],
        ),
      ),
    );
  }
}
