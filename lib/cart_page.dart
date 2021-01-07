
import 'package:fewaclothing/models/cart.dart';
import 'package:fewaclothing/providers/cart_provider.dart';
import 'package:fewaclothing/widgets/cartWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class CartPage extends StatefulWidget {

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<FewaCart> cartItems = [];


  final _globalKeyScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    cartItems = Provider.of<CartProvider>(context, listen: true).fewaCartList;

    return Scaffold(
      key: _globalKeyScaffold,
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
            'My Cart',
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
                icon: Icon(Icons.favorite_outline_sharp),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'wishList');
                }),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:10),
                    child: Text('Products Total:',style: GoogleFonts.waitingForTheSunrise(
                      textStyle: TextStyle(
                          color: Colors.pink,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),),
                  ),
                  Text('Rs. ${Provider.of<CartProvider>(context, listen: true).totalPrice.toString()}',style:TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.blueGrey) ,),
                ],
              ),
            ),
            Container(
                color: Colors.white,width: 450,height: 60, child: checkOutButton()),
          ],
        ),
      ),
      body:
       cartItems.isNotEmpty?
    ListView.builder
        (
          itemCount: cartItems.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return CartWidget(cartItems[index]);
          }
      ): Center(child: Text("No Found")),
    );
  }

  Widget checkOutButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: FlatButton(
        color: Colors.pink,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        splashColor: Colors.pinkAccent,
        child: Text(
          'CHECKOUT (${Provider.of<CartProvider>(context,listen: false).totalQuantity})',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onPressed: () {
          print('Success');
        },
      ),
    );
  }
}

