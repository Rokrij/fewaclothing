import 'package:cached_network_image/cached_network_image.dart';
import 'package:fewaclothing/models/cart.dart';
import 'package:fewaclothing/models/product.dart';
import 'package:fewaclothing/providers/cart_provider.dart';
import 'package:fewaclothing/providers/product_provider.dart';
import 'package:fewaclothing/providers/user_auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_by_category.dart';

class ProductDetails extends StatefulWidget {
  final FewaProduct product;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();

  ProductDetails(this.product);
}

class _ProductDetailsState extends State<ProductDetails>  {
  bool _wishlist = false;
  bool isSizeMSelected = true;
  bool isSizeLSelected = false;
  bool isSizeXLSelected = false;
  bool isSizeXXLSelected = false;

  bool isSize38Selected = true;
  bool isSize39Selected = false;
  bool isSize40Selected = false;
  bool isSize41Selected = false;
  bool isSize42Selected = false;
  bool isSize43Selected = false;


  bool isSize28Selected = true;
  bool isSize29Selected = false;
  bool isSize30Selected = false;
  bool isSize31Selected = false;
  bool isSize32Selected = false;
  bool isSize34Selected = false;


  bool showClothesSize = false;
  bool showShoesSize = false;
  bool showJeansSize=false;

  int counter = 1;
  String productSize='';
  @override
  void initState() {
    // TODO: implement initState
    // _wishlist = Provider.of<ProductProvider>(context, listen: false).isFav(widget.product.id);

    if (widget.product.category.toLowerCase() == 'shoe') {
      showShoesSize = true;
      productSize='38';
    }else if(widget.product.category.toLowerCase() == 'jean' || widget.product.category.toLowerCase() == 'pant'){
      productSize='28';
      showJeansSize=true;
    }else {
      showClothesSize = true;
      productSize='M';
    }

    super.initState();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   _wishlist = Provider.of<ProductProvider>(context, listen: false).isFav(widget.product.id);
  //
  //   super.didChangeAppLifecycleState(state);
  // }

  @override
  Widget build(BuildContext context) {
    _wishlist = Provider.of<ProductProvider>(context, listen: true).isFav(widget.product.id);
    //
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
                        ?
                    Icon(Icons.favorite_sharp, color: Colors.pink):
                    Icon(Icons.favorite_border_sharp, color: Colors.pink)),
                    iconSize: 40,
                    onPressed: () {
                      setState(
                        () {
                          Provider.of<ProductProvider>(context, listen: false).favClick(widget.product.id);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    'Rs. ${widget.product.price}',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.blueGrey,
                          size: 30,
                        ),
                        onPressed: () {
                          if (counter > 1) {
                            setState(() {
                              counter = counter - 1;
                            });
                          }
                        }),
                    Text(
                      '$counter',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.pink,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.blueGrey,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              if (counter < 10) {
                                setState(() {
                                  counter = counter + 1;
                                });
                              }
                            });
                          }),
                    ),
                  ],
                ),
              ],
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
                  textStyle: TextStyle(color: Colors.blueGrey, fontSize: 20),
                ),
              ),
            ),
            Visibility(
              visible: showClothesSize,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    clothesSizeWidget('M', isSizeMSelected),
                    clothesSizeWidget('L', isSizeLSelected),
                    clothesSizeWidget('XL', isSizeXLSelected),
                    clothesSizeWidget('XXL', isSizeXXLSelected),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: showShoesSize,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    shoesSizeWidget('38', isSize38Selected),
                    shoesSizeWidget('39', isSize39Selected),
                    shoesSizeWidget('40', isSize40Selected),
                    shoesSizeWidget('41', isSize41Selected),
                    shoesSizeWidget('42', isSize42Selected),
                    shoesSizeWidget('43', isSize43Selected),
                  ],
                ),
              ),
            ),Visibility(
              visible: showJeansSize,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    jeansSizeWidget('28', isSize28Selected),
                    jeansSizeWidget('29', isSize29Selected),
                    jeansSizeWidget('30', isSize30Selected),
                    jeansSizeWidget('31', isSize31Selected),
                    jeansSizeWidget('32', isSize32Selected),
                    jeansSizeWidget('34', isSize34Selected),
                  ],
                ),
              ),
            ),
            ProductByCatWidget(widget.product.category),
          ],
        ),
      ),
    );
  }

  Widget clothesSizeWidget(String size, bool isSelected) {
    return GestureDetector(
      onTap: () => ClothesSelectSize(size),
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

  Widget shoesSizeWidget(String size, bool isSelected) {
    return GestureDetector(
      onTap: () => ShoesSelectSize(size),
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
  Widget jeansSizeWidget(String size, bool isSelected) {
    return GestureDetector(
      onTap: () => JeansSelectSize(size),
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
          addToCart();
          Fluttertoast.showToast(
              msg: "Added to Cart Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blueGrey,
              textColor: Colors.white,
              fontSize: 16.0
          );
        },
      ),
    );
  }

  void ClothesSelectSize(String clotheSize) {
    setState(() {
      if (clotheSize == 'M') {
        productSize='M';
        isSizeMSelected = true;
        isSizeLSelected = false;
        isSizeXLSelected = false;
        isSizeXXLSelected = false;
      }
      if (clotheSize == 'L') {
        productSize='L';
        isSizeMSelected = false;
        isSizeLSelected = true;
        isSizeXLSelected = false;
        isSizeXXLSelected = false;
      }
      if (clotheSize == 'XL') {
        productSize='XL';
        isSizeMSelected = false;
        isSizeLSelected = false;
        isSizeXLSelected = true;
        isSizeXXLSelected = false;
      }
      if (clotheSize == 'XXL') {
        productSize='XXL';
        isSizeMSelected = false;
        isSizeLSelected = false;
        isSizeXLSelected = false;
        isSizeXXLSelected = true;
      }
    });
  }

  void ShoesSelectSize(String shoeSize) {
    setState(() {
      if (shoeSize == '38') {
        productSize='38';
        isSize38Selected = true;
        isSize39Selected = false;
        isSize40Selected = false;
        isSize41Selected = false;
        isSize42Selected = false;
        isSize43Selected = false;
      }
      if (shoeSize == '39') {
        productSize='39';
        isSize38Selected = false;
        isSize39Selected = true;
        isSize40Selected = false;
        isSize41Selected = false;
        isSize42Selected = false;
        isSize43Selected = false;
      }
      if (shoeSize == '40') {
        productSize='40';
        isSize38Selected = false;
        isSize39Selected = false;
        isSize40Selected = true;
        isSize41Selected = false;
        isSize42Selected = false;
        isSize43Selected = false;
      }
      if (shoeSize == '41') {
        productSize='41';
        isSize38Selected = false;
        isSize39Selected = false;
        isSize40Selected = false;
        isSize41Selected = true;
        isSize42Selected = false;
        isSize43Selected = false;
      }
      if (shoeSize == '42') {
        productSize='42';
        isSize38Selected = false;
        isSize39Selected = false;
        isSize40Selected = false;
        isSize41Selected = false;
        isSize42Selected = true;
        isSize43Selected = false;
      }
      if (shoeSize == '43') {
        productSize='43';
        isSize38Selected = false;
        isSize39Selected = false;
        isSize40Selected = false;
        isSize41Selected = false;
        isSize42Selected = false;
        isSize43Selected = true;
      }
    });
  }void JeansSelectSize(String jeanSize) {
    setState(() {
      if (jeanSize == '28') {
        productSize='28';
        isSize28Selected = true;
        isSize29Selected = false;
        isSize30Selected = false;
        isSize31Selected = false;
        isSize32Selected = false;
        isSize34Selected = false;
      } if (jeanSize == '29') {
        productSize='29';
        isSize28Selected = false;
        isSize29Selected = true;
        isSize30Selected = false;
        isSize31Selected = false;
        isSize32Selected = false;
        isSize34Selected = false;
      } if (jeanSize == '30') {
        productSize='30';
        isSize28Selected = false;
        isSize29Selected = false;
        isSize30Selected =true;
        isSize31Selected = false;
        isSize32Selected = false;
        isSize34Selected = false;
      } if (jeanSize == '31') {
        productSize='31';
        isSize28Selected = false;
        isSize29Selected = false;
        isSize30Selected = false;
        isSize31Selected = true;
        isSize32Selected = false;
        isSize34Selected = false;
      } if (jeanSize == '32') {
        productSize='32';
        isSize28Selected = false;
        isSize29Selected = false;
        isSize30Selected = false;
        isSize31Selected = false;
        isSize32Selected = true;
        isSize34Selected = false;
      } if (jeanSize == '34') {
        productSize='34';
        isSize28Selected = false;
        isSize29Selected = false;
        isSize30Selected = false;
        isSize31Selected = false;
        isSize32Selected = false;
        isSize34Selected = true;
      }

    });
  }
  void addToCart(){

    FewaCart cart=FewaCart(productName:widget.product.name,image: widget.product.image,
        email: Provider.of<UserAuthProvider>(context, listen: false).email,price: widget.product.price,
        quantity: counter.toString(),size: productSize,
    );
    Provider.of<CartProvider>(context,listen: false).addToCart(cart);
  }
}
