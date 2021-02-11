import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AllCategory extends StatelessWidget {
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
      body: Center(
        child: Container(
          child: Text('hohohoho'),
        ),
      ),
    );
  }
}
