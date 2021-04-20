import 'package:cached_network_image/cached_network_image.dart';
import 'package:fewaclothing/models/cart.dart';
import 'package:fewaclothing/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  final FewaCart cart;

  CartWidget(this.cart);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 165,
      child: Padding(
        padding: const EdgeInsets.only(top:20, left:25,right: 25),
        child:
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Container(
            height: 145,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueGrey,
                width: 2,
              ),
              color: Colors.white,

            ),
            child: Row(
              children: [
                Container(
                  width: 130,
                  child: Image(
                      image: CachedNetworkImageProvider(cart.image),
                      height: 125,

                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:20,left: 10),
                      child: Container(
                        height: 35,
                        width: 195,
                        child: Text(
                          cart.productName,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.pink,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:20,left: 10),
                      child: Text(
                        'Size - ${cart.size}',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5,left: 10),
                      child: Text(
                        'Quantity - ${cart.quantity}',

                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,

                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    Padding(
                      padding: const EdgeInsets.only(top:5,left: 10),
                      child: Text(
                        'Rs. ${cart.price}',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.pink,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Delete',
              color: Colors.blueGrey,
              icon: Icons.delete,
              onTap: () {
                Provider.of<CartProvider>(context,listen: false).removeFromCart(cart);
                Fluttertoast.showToast(
                    msg: "Item removed from the cart",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blueGrey,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

