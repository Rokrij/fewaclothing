import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fewaclothing/models/cart.dart';
import 'package:fewaclothing/providers/cart_provider.dart';
import 'package:fewaclothing/widgets/cart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_khalti/flutter_khalti.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class CartPage extends StatefulWidget {

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<FewaCart> cartItems = [];
  int selectedRadio;

  @override
void initState() {
    super.initState();
    selectedRadio=0;
  }
  setSelectedRadio(int val){
    setState(() {
      selectedRadio=val;
    });
  }

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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:10),
                        child: Text('Products Total:',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),),
                      ),
                      Text('Rs. ${Provider.of<CartProvider>(context, listen: true).totalPrice.toString()}',style:TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.blueGrey) ,),
                    ],
                  ),
              // ButtonBar(
              //   alignment: MainAxisAlignment.center,
              //   children: [
              //     RadioListTile(
              //       title: Text("Cash on Delivery"),
              //       value: 1,
              //       groupValue: selectedRadio,
              //       activeColor: Colors.blueGrey,
              //       onChanged:(val){
              //       setSelectedRadio(val);
              //       },
              //     ),
              //     RadioListTile(
              //       title: Text("Cash on Delivery"),
              //       value: 2,
              //       groupValue: selectedRadio,
              //       activeColor: Colors.blueGrey,
              //       onChanged:(val){
              //         setSelectedRadio(val);
              //       },
              //     )
              //   ],
              // )
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
      ): Center(
           child: Opacity(
             opacity: 0.75,
             child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              image: AssetImage('assets/gif/1.gif'),
              height: 125,
          ),
          Text("No items in your cart !!!",
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
          ),
          ),
        ],
      ),
           )),
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
              khaltiPay();
        },
      ),
    );

  }
}
void khaltiPay(){
  FlutterKhalti _flutterKhalti = FlutterKhalti.configure(
    publicKey: "test_public_key_eacadfb91994475d8bebfa577b0bca68",
    urlSchemeIOS: "KhaltiPayFlutterExampleScheme",
  );

  KhaltiProduct product = KhaltiProduct(
    id: "test",
    amount: 1000,
    name: "Hello Product",
  );

  _flutterKhalti.startPayment(
    product: product,
    onSuccess: (data) {
      print("Success message here");
    },
    onFaliure: (error) {
      print("Error message here");
    },
  );
}

