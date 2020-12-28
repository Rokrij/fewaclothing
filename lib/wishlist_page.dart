import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListPage extends StatelessWidget {
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
      ),
      body: Text('This is WishList Page'),
    );
  }
}
