import 'package:cached_network_image/cached_network_image.dart';
import 'package:fewaclothing/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'product_by_category.dart';

class ProductDetails extends StatefulWidget {
  final FewaProduct product;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();

  ProductDetails(this.product);
}

class _ProductDetailsState extends State<ProductDetails> {
  bool _wishlist = true;

  bool isSizeMSelected = true;
  bool isSizeLSelected = false;
  bool isSizeXLSelected = false;
  bool isSizeXXLSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: (Icon(
            Icons.arrow_back_ios,
            color: Colors.pink,
            size: 30,
          )),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.pink),
        title: Center(
          child: Text(
            'Fewa Clothing',
            style: GoogleFonts.greatVibes(
              textStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
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
          ),
        ],
      ),
      bottomNavigationBar:
          Container(color: Colors.white, height: 60, child: addToCartButton()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: Image(
                    image: CachedNetworkImageProvider(widget.product.image),
                    height: 350,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Container(
                    width: 260,
                    child: Text(
                      widget.product.name,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.pink,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    icon: (_wishlist
                        ? Icon(Icons.favorite_border_sharp, color: Colors.pink)
                        : Icon(Icons.favorite_sharp, color: Colors.pink)),
                    iconSize: 40,
                    onPressed: () {
                      setState(
                        () {
                          _wishlist = !_wishlist;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                'Rs. ${widget.product.price}',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.pink, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Text(
                'Description',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.pink),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                widget.product.description,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.pink, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  sizeWidget('M', isSizeMSelected),
                  sizeWidget('L', isSizeLSelected),
                  sizeWidget('XL', isSizeXLSelected),
                  sizeWidget('XXL', isSizeXXLSelected),
                ],
              ),
            ),
            ProductByCatWidget(widget.product.category),
          ],
        ),
      ),
    );
  }

  Widget sizeWidget(String size, bool isSelected) {
    return GestureDetector(
      onTap: () => ClotheSelectSize(size),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? Colors.pink : Colors.white,
              ),
              color: isSelected ? Colors.pink : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              size,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.pink,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget addToCartButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: FlatButton(
        color: Colors.pink,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        splashColor: Colors.pinkAccent,
        child: Text(
          'ADD TO CART',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'cart');
        },
      ),
    );
  }

  void ClotheSelectSize(String clotheSize) {
    setState(() {
      if (clotheSize == 'M') {
        isSizeMSelected = true;
        isSizeLSelected = false;
        isSizeXLSelected = false;
        isSizeXXLSelected = false;
      }if (clotheSize == 'L') {
        isSizeMSelected = false;
        isSizeLSelected = true;
        isSizeXLSelected = false;
        isSizeXXLSelected = false;
      }if (clotheSize == 'XL') {
        isSizeMSelected = false;
        isSizeLSelected = false;
        isSizeXLSelected = true;
        isSizeXXLSelected = false;
      }if (clotheSize == 'XXL') {
        isSizeMSelected = false;
        isSizeLSelected = false;
        isSizeXLSelected = false;
        isSizeXXLSelected = true;
      }
    });
  }
}
