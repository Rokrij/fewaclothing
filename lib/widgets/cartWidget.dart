
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fewaclothing/models/cart.dart';
import 'package:fewaclothing/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class CartWidget extends StatelessWidget {
  final FewaCart cart;

  CartWidget(this.cart);

  @override
  Widget build(BuildContext context) {
    print(cart.productName);
    print(cart.price);
    print(cart.size);
    print(cart.quantity);
    print(cart.email);
    print(cart.image);


    return Container(
      height: 160,
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
                Image(
                    image: CachedNetworkImageProvider(cart.image),
                    height: 125,
                    fit: BoxFit.fill
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Container(
                        height: 35,
                        width: 200,

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
                    // Text(
                    //   'Description',
                    //   style: GoogleFonts.montserrat(
                    //     textStyle: TextStyle(
                    //       color: Colors.blueGrey,
                    //       fontSize: 13,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Text(
                        cart.size,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top:5),
                    //   child: Text(
                    //     'Red',
                    //     style: GoogleFonts.montserrat(
                    //       textStyle: TextStyle(
                    //         color: Colors.blueGrey,
                    //         fontSize: 13,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:5),
                          child: Text(
                            cart.quantity,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 13,

                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 85,),
                        Padding(
                          padding: const EdgeInsets.only(top:5),
                          child: Text(
                            cart.price,
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
              ],
            ),
          ),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Delete',
              color: Colors.blueGrey,
              icon: Icons.delete,
              // onTap: () => showSnackBar("Item Removed !",_globalKeyScaffold),
            ),
          ],
        ),
      ),
    );
  }
}

