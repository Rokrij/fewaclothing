import 'package:fewaclothing/mail.dart';
import 'package:fewaclothing/models/cart.dart';
import 'package:fewaclothing/providers/cart_provider.dart';
import 'package:fewaclothing/providers/user_auth_provider.dart';
import 'package:fewaclothing/utils/constants.dart';
import 'package:fewaclothing/widgets/cart_widget.dart';
import 'package:fewaclothing/widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_khalti/flutter_khalti.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatefulWidget {

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  FlutterLocalNotificationsPlugin localNotification;
  var phoneController = TextEditingController();
  var deliveryAddressController = TextEditingController();
  List<FewaCart> cartItems = [];
  int selectedRadio;
  var phone;
  var deliveryAddress;
  @override
void initState() {
    super.initState();
    var andriodInitialize= new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initialzationSettings=new InitializationSettings(android: andriodInitialize);
    localNotification=new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initialzationSettings);
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
          cartItems.isNotEmpty?displayCheckOutDetailsOption():displayNoOption();
        },
      ),
    );

  }
  void displayCheckOutDetailsOption(){

    showMaterialModalBottomSheet(

      context: context,

      builder: (context) => Container(
        height: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Fill up the form to confirm your order:',style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          ),
                          ),
                          ), IconButton(
                            icon: (Icon(
                              Icons.clear,
                              color: Colors.pink,
                              size: 30,
                            )),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  TextField(
                    style:GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                    ),
                  ),
                    controller: phoneController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone), labelText: 'Phone Number', fillColor: Colors.pink),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: TextField(
                      style:GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                        ),
                      ),
                      controller:deliveryAddressController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.location_pin), labelText: 'Delivery Address', fillColor: Colors.pink),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:15.0, left:30),
                    child: Container(
                      width: 335,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: FlatButton(
                        onPressed: () {
                          phone = phoneController.text;
                          deliveryAddress = deliveryAddressController.text;
                          if (phoneController.text.isEmpty ||
                              deliveryAddressController.text.isEmpty || phoneController.text.length!=10) {
                            Fluttertoast.showToast(
                                msg: "Data Incorrect/Invalid!!!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.blueGrey,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          } else {
                            addCart();
                            sendMail();
                          showMaterialModalBottomSheet(
                            isDismissible: false,
                            context: context,
                            builder: (context) => Container(
                              height: 270,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, top:20),
                                    child: Text('Payment Methods:',style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 20,
                                      ),
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20,top:20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.purple,
                                              borderRadius: BorderRadius.circular(15)
                                          ),

                                          child: FlatButton(
                                            child: Text('Khalti',
                                              style: GoogleFonts.raleway(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),),
                                          ),
                                        ), onTap: (){
                                          khaltiPay();
                                          cartItems=[];
                                          Provider.of<CartProvider>(context,listen: false).emptyFromCart();
                                          Navigator.pushNamedAndRemoveUntil(
                                              context, 'confirmation', (route) => false);
                                        },),
                                        GestureDetector(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.pink,
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                            child: FlatButton(
                                              child: Text('Cash on Delivery',
                                                style: GoogleFonts.raleway(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ),),
                                            ),
                                          ), onTap: (){
                                          cartItems=[];
                                          Provider.of<CartProvider>(context,listen: false).emptyFromCart();
                                          Navigator.pushNamedAndRemoveUntil(
                                              context, 'confirmation', (route) => false);
                                          _showNotification;
                                        },),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text('* choose one of the payment options !',
                                      style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15,
                                      ),
                                    ),),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20, top:50),
                                      child: Text('#SHOPWITHFEWA',style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          color: Colors.pink,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );}
                        },
                        child: Text('Confirm',
                          style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void displayNoOption(){
    showSnackBar("No items to check out !!!");
  }
  void khaltiPay(){
    FlutterKhalti _flutterKhalti = FlutterKhalti.configure(
      publicKey: "test_public_key_eacadfb91994475d8bebfa577b0bca68",
      urlSchemeIOS: "KhaltiPayFlutterExampleScheme",
    );

    KhaltiProduct product = KhaltiProduct(
      id: "Fewa Clothing",
      amount: Provider.of<CartProvider>(context, listen: false).totalPrice * 100.0,
      name: "Clothing Item",
    );

    _flutterKhalti.startPayment(
      product: product,
      onSuccess: (data) {
        print("Payment Successful");
      },
      onFaliure: (error) {
        print("There was an error !");
      },
    );
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blueGrey,
      content: Text(
        message,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
    _globalKeyScaffold.currentState.showSnackBar(snackBar);
  }
  Future _showNotification() async{
var androidDetails=new AndroidNotificationDetails("channelId", "Local Notification", "channelDescription",
    importance: Importance.high);
var generalNotificationDetails=new NotificationDetails(android: androidDetails);
 await localNotification.show(0, "title", "body", generalNotificationDetails);
  }

  void addCart() async {
    var url = "$ADD_CART_URL?phonenumber=$phone&deliveryaddress=$deliveryAddress";
    var response = await http.get(url);
  }
}

