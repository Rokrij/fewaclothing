import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fewaclothing/widgets/newarrival_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewArrivalPage extends StatefulWidget {
  @override
  _NewArrivalPageState createState() => _NewArrivalPageState();
}

class _NewArrivalPageState extends State<NewArrivalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.pink),
        title: Text(
          'Fewa Clothing',
          style: GoogleFonts.greatVibes(
            textStyle: TextStyle(
                color: Colors.pink, fontSize: 35, fontWeight: FontWeight.bold),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TypewriterAnimatedTextKit(
                speed: Duration(milliseconds: 100),
                text: ["NEW ARRIVALS !!!", "SHOP NOW !!!"],
                textStyle: TextStyle(
                    fontSize: 25.0,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold),
                pause: Duration(milliseconds: 1000),
              ),
            ),

            NewArrivalWidget(),
          ],
        ),
      ),
    );
  }
}
