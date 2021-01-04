import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartPage> cartItems = [];


  final _globalKeyScaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: Container(color: Colors.white, height: 60, child: checkOutButton()),
      body: Padding(
        padding: const EdgeInsets.only(top:20, left:25,right: 25),
        child: 
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Container(
            height: 145,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.pink,
                width: 2,
              ),
              color: Colors.white,

            ),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/images/3.png'),
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
                          'Nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee',
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
                    Text(
                      'Description',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Text(
                        'Size: 7',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5),
                      child: Text(
                        'Red',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:5),
                          child: Text(
                            'Quantity: 7',
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
                            'Rs. 2000',
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
              color: Colors.pink,
              icon: Icons.delete,
              onTap: () => showSnackBar("Item Removed !",_globalKeyScaffold),
            ),
          ],
        ),
      ),
    );
  }
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
        'CHECKOUT (10)',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      onPressed: () {
        print('Success');
      },
    ),
  );
}
void showSnackBar(String message,GlobalKey<ScaffoldState> _globalKeyScaffold) {
  final snackBar = SnackBar(
    elevation: 6.0,
    behavior: SnackBarBehavior.floating,
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

