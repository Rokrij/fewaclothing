import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                  Navigator.pushNamed(context, 'wishList');
                }),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:20, left:25,right: 25),
        child: Container(
          height: 175,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.pink,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),

          ),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/images/3.png'),
                height: 150,
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
                      child: Text(
                        'Name',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.pink,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Rs. 2000',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Text(
                      'Color: Red',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Text(
                          'Quantity: 7',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 50,),
                      Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Text(
                          'Size: 7',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.blueGrey,
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
      ),
    );
  }
}
